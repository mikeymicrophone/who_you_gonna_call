class EstablishmentsController < ApplicationController
  # GET /establishments
  # GET /establishments.xml
  def index
    @establishments = Establishment.scope_down(self, params, 'rendezvouz', 'visit', 'party', 'guest', 'address_use', 'address', 'call', 'detail', 'email_use', 'email', 'alias_use', 'alias', 'phone_use', 'phone', 'website_use', 'website')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @establishments }
    end
  end

  # GET /establishments/1
  # GET /establishments/1.xml
  def show
    @establishment = Establishment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @establishment }
    end
  end

  # GET /establishments/new
  # GET /establishments/new.xml
  def new
    @establishment = Establishment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @establishment }
    end
  end

  # GET /establishments/1/edit
  def edit
    @establishment = Establishment.find(params[:id])
  end

  # POST /establishments
  # POST /establishments.xml
  def create
    @establishment = Establishment.new(params[:establishment])

    respond_to do |format|
      if @establishment.save
        flash[:notice] = 'Establishment was successfully created.'
        format.html { redirect_to(@establishment) }
        format.xml  { render :xml => @establishment, :status => :created, :location => @establishment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @establishment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /establishments/1
  # PUT /establishments/1.xml
  def update
    @establishment = Establishment.find(params[:id])

    respond_to do |format|
      if @establishment.update_attributes(params[:establishment])
        flash[:notice] = 'Establishment was successfully updated.'
        format.html { redirect_to(@establishment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @establishment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /establishments/1
  # DELETE /establishments/1.xml
  def destroy
    @establishment = Establishment.find(params[:id])
    @establishment.destroy

    respond_to do |format|
      format.html { redirect_to(establishments_url) }
      format.xml  { head :ok }
    end
  end
end
