class ZipsController < ApplicationController
  # GET /zips
  # GET /zips.xml
  def index
    @zips = Zip.scope_down(self, params, 'address', 'city', 'state', 'country')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @zips }
    end
  end

  # GET /zips/1
  # GET /zips/1.xml
  def show
    @zip = Zip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @zip }
    end
  end

  # GET /zips/new
  # GET /zips/new.xml
  def new
    @zip = Zip.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @zip }
    end
  end

  # GET /zips/1/edit
  def edit
    @zip = Zip.find(params[:id])
  end

  # POST /zips
  # POST /zips.xml
  def create
    @zip = Zip.new(params[:zip])

    respond_to do |format|
      if @zip.save
        flash[:notice] = 'Zip was successfully created.'
        format.html { redirect_to(@zip) }
        format.xml  { render :xml => @zip, :status => :created, :location => @zip }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @zip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /zips/1
  # PUT /zips/1.xml
  def update
    @zip = Zip.find(params[:id])

    respond_to do |format|
      if @zip.update_attributes(params[:zip])
        flash[:notice] = 'Zip was successfully updated.'
        format.html { redirect_to(@zip) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @zip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /zips/1
  # DELETE /zips/1.xml
  def destroy
    @zip = Zip.find(params[:id])
    @zip.destroy

    respond_to do |format|
      format.html { redirect_to(zips_url) }
      format.xml  { head :ok }
    end
  end
end
