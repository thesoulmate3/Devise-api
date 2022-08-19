module Api
  module V1
    module Users
      class SessionsController < ApplicationController
        def login
          user = User.find_by_email user_params[:email]
          if user&.valid_password?(user_params[:password])
            session[:user_id] = user.id
            render json: {
              user: user,
              status: :created,
              logged_in: true,
              message: 'Login successful'
            }
          else
            render status: 400,
              json: { 
                status: 401,
                message: 'Wrong credentials'
              }
          end
        end

        def logout
          session[:user_id] = nil
          render json: {
            status: 200,
            message: 'Logout successful'
        }
        end

        private

        def user_params
          params.require(:user).permit(:email, :password)
        end
      end
    end
  end
end