module Api
  module V1
    module Users
      # Manages {User} information related to {devise-api}
      class RegistrationsController < ApplicationController

        # Creates new User
        def create
          user = User.new(user_params)
          if user.save
            render json: { 
              status: 201,
              user: user,
              message: 'User registered successfully'
            }
          else
            render status: 400,
              json: { 
                message: user.errors.full_messages 
              }
          end
        end
        
        # Verifies for the user 
        def verify
          user = User.find_by_email user_params[:email]
          if user&.valid_password?(user_params[:password])
            render status: 200,
              json: { 
                message: 'True, user was found',
                user: user
              }
          else
            render status: 400,
              json: { 
                status: 404,
                message: 'False, something went wrong or user not found',
              }
          end
        end

        private

        # Only allow a list of trusted parameters through.
        def user_params
          params.require(:user).permit(:name, :phone, :email, :password)
        end
      end
    end
  end
end
