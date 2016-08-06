module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags 'ActionCable', current_user.name
    end

    protected

      def find_verified_user
        # NOTE: session[:user_id] returns nil
        User.find session["user_id"]
      rescue
        reject_unauthorized_connection
      end

      # cookieからsessionを拾ってくる
      # cf: http://qiita.com/masuidrive/items/fd13ab8d9410206a1b91
      def session
        @session ||= cookies.encrypted[Rails.application.config.session_options[:key]]
      end
  end
end
