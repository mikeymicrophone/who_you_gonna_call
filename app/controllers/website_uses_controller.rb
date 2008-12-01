class WebsiteUsesController < ApplicationController
  # GET /website_uses
  # GET /website_uses.xml
  def index
    @website_uses = WebsiteUse.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @website_uses }
    end
  end

  # GET /website_uses/1
  # GET /website_uses/1.xml
  def show
    @website_use = WebsiteUse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @website_use }
    end
  end

  # GET /website_uses/new
  # GET /website_uses/new.xml
  def new
    @website_use = WebsiteUse.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @website_use }
    end
  end

  # GET /website_uses/1/edit
  def edit
    @website_use = WebsiteUse.find(params[:id])
  end

  # POST /website_uses
  # POST /website_uses.xml
  def create
    @website_use = WebsiteUse.new(params[:website_use])

    respond_to do |format|
      if @website_use.save
        flash[:notice] = 'WebsiteUse was successfully created.'
        format.html { redirect_to(@website_use) }
        format.xml  { render :xml => @website_use, :status => :created, :location => @website_use }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @website_use.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /website_uses/1
  # PUT /website_uses/1.xml
  def update
    @website_use = WebsiteUse.find(params[:id])

    respond_to do |format|
      if @website_use.update_attributes(params[:website_use])
        flash[:notice] = 'WebsiteUse was successfully updated.'
        format.html { redirect_to(@website_use) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @website_use.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /website_uses/1
  # DELETE /website_uses/1.xml
  def destroy
    @website_use = WebsiteUse.find(params[:id])
    @website_use.destroy

    respond_to do |format|
      format.html { redirect_to(website_uses_url) }
      format.xml  { head :ok }
    end
  end
end
