class BoxesController < ApplicationController
  before_action :set_box, only: [:show, :edit, :update, :destroy]

  # GET /boxes
  def index
    @boxes = Box.all
  end

  # GET /boxes/1
  def show
  end

  # GET /boxes/new
  def new
    @box = Box.new
  end

  # GET /boxes/1/edit
  def edit
  end

  # POST /boxes
  def create
    @box = Box.new(box_params)

    respond_to do |format|
      if @box.save
        format.html { redirect_to boxes_path, notice: 'Box was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /boxes/1
  def update
    respond_to do |format|
      if @box.update(box_params)
        format.html { redirect_to boxes_path, notice: 'Box was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /boxes/1
  def destroy
    @box.destroy
    respond_to do |format|
      format.html { redirect_to boxes_path }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_box
      @box = Box.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def box_params
      params.require(:box).permit(:name, :volume)
    end
end
