class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  def new
    @user = User.new
  end
  
  def index
    @users = User.scope_down(self, params, 'detail', 'person', 'address', 'address_use', 'alias', 'alias_use', 'authorization', 'call', 'city', 'country', 'detail', 'email', 'email_use', 'establishment', 'guest', 'message', 'party', 'phone', 'phone_use', 'rendezvouz', 'service', 'state', 'street', 'txt', 'unit', 'visit', 'website', 'website_use', 'zip')
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end

  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
end
