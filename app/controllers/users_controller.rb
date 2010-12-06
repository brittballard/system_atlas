class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  before_filter :load_user, :except => [:index]

  def index
    unless params.has_key?(:organization_id)
      @users = User.accessible_by(current_ability, :manage)
    else
      @users = User.where('organization_id = ?', params[:organization_id])
    end
  end

  def new
    
  end

  def create
    organization = Organization.where('registration_code = ?', params[:registration_code]).first
    
    if organization.present?
      @user.organization = organization
      
      if @user.save
        flash[:notice] = "Account registered!"
        redirect_back_or_default account_url
      else
        render :action => :new
      end
    else
      flash[:error] = 'Incorrect organization code.'
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
      @user = User.new(params[:user])
    end
  end
end
