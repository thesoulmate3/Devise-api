module Api
  module V1
    module Users
      # Manages User Registeration
      class RegistrationsController < ApplicationController

        # Creates new User
        def create
          user = User.new(user_params)
          if user.save
            render json: { 
              status: 201,
              user: user,
              message: "User registered successfully"
            }
          else
            render status: 400,
              json: { message: user.errors.full_messages }
          end
        end
        
        # Verifies for the user 
        def verify
          user = User.find_by params[:email]
          if user && user.valid_password?(params[:password])
            render status: 200,
                json: { message: "True" }
          else
            render status: 400,
              json: { message: "False"}
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
