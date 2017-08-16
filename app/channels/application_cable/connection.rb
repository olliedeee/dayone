module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_auth_user

    def connect
      self.current_auth_user = find_current_user
    end

    def disconnect
    end

  protected
    def find_current_user
      if current_auth_user = User.find_by(id: cookies.signed[:user_id])
        current_auth_user
      else
        reject_unauthorized_connection
      end
    end
  end
end