class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  end
end
