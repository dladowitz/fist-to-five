class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @page_name = "Find someone new to follow"
    @users = User.all
  end

  def new
    @user = User.new

    render layout: "landing_page/landing_layout"
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = "User account created successfully"
      @understandings = @user.understandings
      redirect_to signin_path
    else
      render :new
    end
  end

  def show
    @page_name = "Dashboard"

    if @user
      @understandings = @user.understandings
      render :show
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
