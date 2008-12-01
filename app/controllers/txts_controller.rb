class TxtsController < ApplicationController
  # GET /txts
  # GET /txts.xml
  def index
    @txts = Txt.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @txts }
    end
  end

  # GET /txts/1
  # GET /txts/1.xml
  def show
    @txt = Txt.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @txt }
    end
  end

  # GET /txts/new
  # GET /txts/new.xml
  def new
    @txt = Txt.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @txt }
    end
  end

  # GET /txts/1/edit
  def edit
    @txt = Txt.find(params[:id])
  end

  # POST /txts
  # POST /txts.xml
  def create
    @txt = Txt.new(params[:txt])

    respond_to do |format|
      if @txt.save
        flash[:notice] = 'Txt was successfully created.'
        format.html { redirect_to(@txt) }
        format.xml  { render :xml => @txt, :status => :created, :location => @txt }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @txt.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /txts/1
  # PUT /txts/1.xml
  def update
    @txt = Txt.find(params[:id])

    respond_to do |format|
      if @txt.update_attributes(params[:txt])
        flash[:notice] = 'Txt was successfully updated.'
        format.html { redirect_to(@txt) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @txt.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /txts/1
  # DELETE /txts/1.xml
  def destroy
    @txt = Txt.find(params[:id])
    @txt.destroy

    respond_to do |format|
      format.html { redirect_to(txts_url) }
      format.xml  { head :ok }
    end
  end
end
