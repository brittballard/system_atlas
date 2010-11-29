class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  before_filter :load_user, :except => [:index]

  def index
    @users = User.accessible_by(current_ability, :manage)
  end

  def new
  end

  def create
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end

  def show
  end

  def edit
    
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
  
  def load_user
    if current_user.present?
      @user = current_user if @user.nil?
    else
      debugger
      @user = User.new(params[:user])
    end
  end
end
