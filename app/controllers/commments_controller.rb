class CommmentsController < ApplicationController
  # GET /commments
  # GET /commments.xml
  def index
    @commments = Commment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @commments }
    end
  end

  # GET /commments/1
  # GET /commments/1.xml
  def show
    @commment = Commment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @commment }
    end
  end

  # GET /commments/new
  # GET /commments/new.xml
  def new
    @commment = Commment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @commment }
    end
  end

  # GET /commments/1/edit
  def edit
    @commment = Commment.find(params[:id])
  end

  # POST /commments
  # POST /commments.xml
  def create
    @commment = Commment.new(params[:commment])

    respond_to do |format|
      if @commment.save
        format.html { redirect_to(@commment, :notice => 'Commment was successfully created.') }
        format.xml  { render :xml => @commment, :status => :created, :location => @commment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @commment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /commments/1
  # PUT /commments/1.xml
  def update
    @commment = Commment.find(params[:id])

    respond_to do |format|
      if @commment.update_attributes(params[:commment])
        format.html { redirect_to(@commment, :notice => 'Commment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @commment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /commments/1
  # DELETE /commments/1.xml
  def destroy
    @commment = Commment.find(params[:id])
    @commment.destroy

    respond_to do |format|
      format.html { redirect_to(commments_url) }
      format.xml  { head :ok }
    end
  end
end
