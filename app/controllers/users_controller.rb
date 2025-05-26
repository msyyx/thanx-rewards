class UsersController < ApplicationController
  before_action :find_user, only: [ :show ]

  def show
    render :show, status: :ok
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
