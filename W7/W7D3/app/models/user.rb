class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true

    

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)

        if user && user.is_password?(password)
            user
        else
            nil
        end
    end


end
