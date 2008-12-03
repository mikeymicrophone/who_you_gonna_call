class RendezvouzsController < ApplicationController
  # GET /rendezvouzs
  # GET /rendezvouzs.xml
  def index
    @rendezvouzs = Rendezvouz.scope_down(self, params, 'detail', 'guest', 'website_use', 'website', *Rendezvouz.targets)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rendezvouzs }
    end
  end

  # GET /rendezvouzs/1
  # GET /rendezvouzs/1.xml
  def show
    @rendezvouz = Rendezvouz.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rendezvouz }
    end
  end

  # GET /rendezvouzs/new
  # GET /rendezvouzs/new.xml
  def new
    @rendezvouz = Rendezvouz.new params[:rendezvouz]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rendezvouz }
    end
  end

  # GET /rendezvouzs/1/edit
  def edit
    @rendezvouz = Rendezvouz.find(params[:id])
  end

  # POST /rendezvouzs
  # POST /rendezvouzs.xml
  def create
    @rendezvouz = Rendezvouz.new(params[:rendezvouz])

    respond_to do |format|
      if @rendezvouz.save
        flash[:notice] = 'Rendezvouz was successfully created.'
        format.html { redirect_to(@rendezvouz) }
        format.xml  { render :xml => @rendezvouz, :status => :created, :location => @rendezvouz }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rendezvouz.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rendezvouzs/1
  # PUT /rendezvouzs/1.xml
  def update
    @rendezvouz = Rendezvouz.find(params[:id])

    respond_to do |format|
      if @rendezvouz.update_attributes(params[:rendezvouz])
        flash[:notice] = 'Rendezvouz was successfully updated.'
        format.html { redirect_to(@rendezvouz) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rendezvouz.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rendezvouzs/1
  # DELETE /rendezvouzs/1.xml
  def destroy
    @rendezvouz = Rendezvouz.find(params[:id])
    @rendezvouz.destroy

    respond_to do |format|
      format.html { redirect_to(rendezvouzs_url) }
      format.xml  { head :ok }
    end
  end
end
