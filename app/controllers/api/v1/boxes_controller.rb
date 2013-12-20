class Api::V1::BoxesController < ApiController
  before_action :set_box, only: [:show, :update, :destroy]

  # GET /boxes.json
  def index
    @boxes = Box.all
  end

  # GET /boxes/1.json
  def show
  end

  # POST /boxes.json
  def create
    @box = Box.new(box_params)

    respond_to do |format|
      if @box.save
        format.json { render action: 'show', status: :created, location: @box }
      else
        format.json { render json: @box.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boxes/1.json
  def update
    respond_to do |format|
      if @box.update(box_params)
        format.json { head :no_content }
      else
        format.json { render json: @box.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boxes/1.json
  def destroy
    @box.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def set_box
    @box = Box.find(params[:id])
  end

  def box_params
    params.require(:box).permit(:name, :volume)
  end

end