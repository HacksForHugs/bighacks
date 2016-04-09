class UsersController < ApplicationController
	def show
		@user = current_user
		@questions = @user.question.all
	end
end
