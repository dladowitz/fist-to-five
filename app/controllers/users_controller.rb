class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @page_name = "Find someone new to follow"
  end

  def new
    render layout: "landing_page/landing_layout"
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = "User account created successfully"
      @understandings = @user.understandings
      session[:id] = @user.id
      redirect_to user_path(@user)
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

  def edit
    @page_name = @user.first_name.capitalize
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = "Updated account"
      redirect_to edit_user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :admin, :password, :password_confirmation)
  end
end
