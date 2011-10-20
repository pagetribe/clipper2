class ClippingsController < ApplicationController
  # GET /clippings
  # GET /clippings.json
  def index
    @clippings = Clipping.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clippings }
    end
  end

  # GET /clippings/1
  # GET /clippings/1.json
  def show
    @clipping = Clipping.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clipping }
    end
  end

  # GET /clippings/new
  # GET /clippings/new.json
  def new
    @clipping = Clipping.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clipping }
    end
  end

  # GET /clippings/1/edit
  def edit
    @clipping = Clipping.find(params[:id])
  end

  # POST /clippings
  # POST /clippings.json
  def create
    @clipping = Clipping.new(params[:clipping])

    respond_to do |format|
      if @clipping.save
        format.html { redirect_to @clipping, notice: 'Clipping was successfully created.' }
        format.json { render json: @clipping, status: :created, location: @clipping }
      else
        format.html { render action: "new" }
        format.json { render json: @clipping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clippings/1
  # PUT /clippings/1.json
  def update
    @clipping = Clipping.find(params[:id])

    respond_to do |format|
      if @clipping.update_attributes(params[:clipping])
        format.html { redirect_to @clipping, notice: 'Clipping was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @clipping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clippings/1
  # DELETE /clippings/1.json
  def destroy
    @clipping = Clipping.find(params[:id])
    @clipping.destroy

    respond_to do |format|
      format.html { redirect_to clippings_url }
      format.json { head :ok }
    end
  end
end
