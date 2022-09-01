class SessionsController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

        if @user
            login!(@user)
            redirect_to cats_url
        else
            render :new
        end
    end
    
    def destroy
        if @current_user
            @current_user.reset.session_token!
            session[:session_token] = nil
            @current_user
        end
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
