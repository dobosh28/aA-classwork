class SessionsController < ApplicationController
    before_action :require_logged_in, only: [:create, :destroy]

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )

        if @user.nil?
            @user = User.new(username: params[:user][:username])
            flash.now[:errors] = ['Invalid username or password']
            render :new
        else
            login(@user)
            redirect_to user_url(@user)
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end
end
