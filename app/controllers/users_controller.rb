class UsersController < ApplicationController

	# def update
 #  		authorize! :assign_roles, @user if params[:user][:assign_roles]
	# end


	private

	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
	end
end
