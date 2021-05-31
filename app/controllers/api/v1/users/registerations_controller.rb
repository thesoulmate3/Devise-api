module Api
  module V1
    module Users
      # Manages User Registeration
      class RegisterationsController < ApplicationController

        # Creates new User
        def create
          user = User.new(user_params)
          if user.save
            render status: 200,
              json: { user: user }
          else
            render status: 400,
              json: { message: user.errors.full_messages }
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
