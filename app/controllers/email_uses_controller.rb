class EmailUsesController < ApplicationController
  # GET /email_uses
  # GET /email_uses.xml
  def index
    @email_uses = EmailUse.scope_down(self, params, 'email', *EmailUse.targets)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @email_uses }
    end
  end

  # GET /email_uses/1
  # GET /email_uses/1.xml
  def show
    @email_use = EmailUse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @email_use }
    end
  end

  # GET /email_uses/new
  # GET /email_uses/new.xml
  def new
    @email_use = EmailUse.new params[:email_use]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @email_use }
    end
  end

  # GET /email_uses/1/edit
  def edit
    @email_use = EmailUse.find(params[:id])
  end

  # POST /email_uses
  # POST /email_uses.xml
  def create
    @email_use = EmailUse.new(params[:email_use])

    respond_to do |format|
      if @email_use.save
        flash[:notice] = 'EmailUse was successfully created.'
        format.html { redirect_to(@email_use) }
        format.xml  { render :xml => @email_use, :status => :created, :location => @email_use }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @email_use.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /email_uses/1
  # PUT /email_uses/1.xml
  def update
    @email_use = EmailUse.find(params[:id])

    respond_to do |format|
      if @email_use.update_attributes(params[:email_use])
        flash[:notice] = 'EmailUse was successfully updated.'
        format.html { redirect_to(@email_use) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @email_use.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /email_uses/1
  # DELETE /email_uses/1.xml
  def destroy
    @email_use = EmailUse.find(params[:id])
    @email_use.destroy

    respond_to do |format|
      format.html { redirect_to(email_uses_url) }
      format.xml  { head :ok }
    end
  end
end
