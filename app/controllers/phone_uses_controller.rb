class PhoneUsesController < ApplicationController
  # GET /phone_uses
  # GET /phone_uses.xml
  def index
    @phone_uses = PhoneUse.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @phone_uses }
    end
  end

  # GET /phone_uses/1
  # GET /phone_uses/1.xml
  def show
    @phone_use = PhoneUse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @phone_use }
    end
  end

  # GET /phone_uses/new
  # GET /phone_uses/new.xml
  def new
    @phone_use = PhoneUse.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @phone_use }
    end
  end

  # GET /phone_uses/1/edit
  def edit
    @phone_use = PhoneUse.find(params[:id])
  end

  # POST /phone_uses
  # POST /phone_uses.xml
  def create
    @phone_use = PhoneUse.new(params[:phone_use])

    respond_to do |format|
      if @phone_use.save
        flash[:notice] = 'PhoneUse was successfully created.'
        format.html { redirect_to(@phone_use) }
        format.xml  { render :xml => @phone_use, :status => :created, :location => @phone_use }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @phone_use.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /phone_uses/1
  # PUT /phone_uses/1.xml
  def update
    @phone_use = PhoneUse.find(params[:id])

    respond_to do |format|
      if @phone_use.update_attributes(params[:phone_use])
        flash[:notice] = 'PhoneUse was successfully updated.'
        format.html { redirect_to(@phone_use) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @phone_use.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /phone_uses/1
  # DELETE /phone_uses/1.xml
  def destroy
    @phone_use = PhoneUse.find(params[:id])
    @phone_use.destroy

    respond_to do |format|
      format.html { redirect_to(phone_uses_url) }
      format.xml  { head :ok }
    end
  end
end
