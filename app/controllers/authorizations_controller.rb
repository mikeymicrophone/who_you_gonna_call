class AuthorizationsController < ApplicationController
  # GET /authorizations
  # GET /authorizations.xml
  def index
    @authorizations = Authorization.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @authorizations }
    end
  end

  # GET /authorizations/1
  # GET /authorizations/1.xml
  def show
    @authorization = Authorization.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @authorization }
    end
  end

  # GET /authorizations/new
  # GET /authorizations/new.xml
  def new
    @authorization = Authorization.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @authorization }
    end
  end

  # GET /authorizations/1/edit
  def edit
    @authorization = Authorization.find(params[:id])
  end

  # POST /authorizations
  # POST /authorizations.xml
  def create
    @authorization = Authorization.new(params[:authorization])

    respond_to do |format|
      if @authorization.save
        flash[:notice] = 'Authorization was successfully created.'
        format.html { redirect_to(@authorization) }
        format.xml  { render :xml => @authorization, :status => :created, :location => @authorization }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @authorization.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /authorizations/1
  # PUT /authorizations/1.xml
  def update
    @authorization = Authorization.find(params[:id])

    respond_to do |format|
      if @authorization.update_attributes(params[:authorization])
        flash[:notice] = 'Authorization was successfully updated.'
        format.html { redirect_to(@authorization) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @authorization.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /authorizations/1
  # DELETE /authorizations/1.xml
  def destroy
    @authorization = Authorization.find(params[:id])
    @authorization.destroy

    respond_to do |format|
      format.html { redirect_to(authorizations_url) }
      format.xml  { head :ok }
    end
  end
end
