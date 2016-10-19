class UsersController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if update_password(@user)
      bypass_sign_in(@user)
      redirect_to root_path
    else
      render "edit"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def update_password(user)
    if user.valid_password?(user_params[:current_password])
      return @user.update(user_params)
    else
      user.errors.add(:current_password, "incorrect")
      return false
    end
  end

  def user_params
    params.require(:user).permit(:email, :current_password, :password, :password_confirmation)
  end
end