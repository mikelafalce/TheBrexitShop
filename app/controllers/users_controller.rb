class UsersController < ApplicationController
  before_action(:find_user, {only: [:show, :edit, :destroy, :update] })

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    user_params = params.require(:user).permit(:username,
                                               :first_name,
                                               :last_name,
                                               :email,
                                               :password,
                                               :password_confirmation )
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Account created successfully'
    else
      render :new
    end
  end

  def update
    user_params = params.require(:user).permit(:username,
                                               :first_name,
                                               :last_name,
                                               :email )
    @user = User.find(params[:id])
    if @user.update user_params
      redirect_to root_path, notice: 'Account updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'Account successfully deleted.'
  end

  private

    def find_user
      @user = User.find(params[:id])
    end
end
