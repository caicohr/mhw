class UsersController < ApplicationController
  before_action :authenticate, except: [:new, :create]
  
  before_action :load_user, except: [:index, :new, :create]
  
  def index
    @users = User.all
  end
  
  def new
    if session[:user_hash]
      @user = User.new_from_hash(session[:user_hash])
      @user.valid?
    else
      @user = User.new
    end
  end
  
  def create
    if session[:user_hash]
      @user = User.new_from_hash(session[:user_hash])
      @user.name = user_params[:name]
      @user.email = user_params[:email]
      @user.username = user_params[:username]
    else
      @user = User.new user_params
    end
    if @user.save
      session[:user_hash] = nil
      login(@user)
      redirect_to root_path, notice: "Account Created."
    else
      render :new
    end
  end
  
  def show
    @user = current_user
  end
  
  def edit
  end
  
  def update
    if @user.update user_params
      redirect_to root_path, notice: "User updated!"
    else
      render :edit
    end
  end
  
  def destroy
    logout
    @user.destroy
    redirect_to root_path, alert: "User deleted!"
  end
  
  private
  
  def load_user
    @user = User.find params[:id]
  end
  
  def user_params
    params.require(:user).permit(:name,:username,:email,:current_password,:password,:password_confirmation)
  end
  
end
