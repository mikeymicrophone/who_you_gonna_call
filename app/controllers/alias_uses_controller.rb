class AliasUsesController < ApplicationController
  # GET /alias_uses
  # GET /alias_uses.xml
  def index
    @alias_uses = AliasUse.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @alias_uses }
    end
  end

  # GET /alias_uses/1
  # GET /alias_uses/1.xml
  def show
    @alias_use = AliasUse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @alias_use }
    end
  end

  # GET /alias_uses/new
  # GET /alias_uses/new.xml
  def new
    @alias_use = AliasUse.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @alias_use }
    end
  end

  # GET /alias_uses/1/edit
  def edit
    @alias_use = AliasUse.find(params[:id])
  end

  # POST /alias_uses
  # POST /alias_uses.xml
  def create
    @alias_use = AliasUse.new(params[:alias_use])

    respond_to do |format|
      if @alias_use.save
        flash[:notice] = 'AliasUse was successfully created.'
        format.html { redirect_to(@alias_use) }
        format.xml  { render :xml => @alias_use, :status => :created, :location => @alias_use }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @alias_use.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /alias_uses/1
  # PUT /alias_uses/1.xml
  def update
    @alias_use = AliasUse.find(params[:id])

    respond_to do |format|
      if @alias_use.update_attributes(params[:alias_use])
        flash[:notice] = 'AliasUse was successfully updated.'
        format.html { redirect_to(@alias_use) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @alias_use.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /alias_uses/1
  # DELETE /alias_uses/1.xml
  def destroy
    @alias_use = AliasUse.find(params[:id])
    @alias_use.destroy

    respond_to do |format|
      format.html { redirect_to(alias_uses_url) }
      format.xml  { head :ok }
    end
  end
end
