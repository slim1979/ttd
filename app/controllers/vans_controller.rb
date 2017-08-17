class VansController < ApplicationController
  before_action :set_van, only: %i[show edit update destroy]
  # GET /vans
  def index
    @vans = Van.all
  end

  # GET /vans/1
  def show; end

  # GET /vans/new
  def new
    @van = Van.new
  end

  # GET /vans/1/edit
  def edit; end

  # POST /vans
  def create
    @van = Van.new(van_params)

    if @van.save
      redirect_to vans_path(@van), notice: 'Вагон успешно создан.'
    else
      render :new
    end
  end

  # PATCH/PUT /vans/1
  def update
    if @van.update(van_params)
      redirect_to vans_path(@van), notice: 'Вагон успешно обновлен.'
    else
      render :edit
    end
  end

  # DELETE /vans/1
  def destroy
    @van.destroy
    redirect_to vans_url, notice: 'Вагон удален. Жаль его. Он был так молод...'
  end

  private

  # Use callbacks to share common setup or consvants between actions.
  def set_van
    @van = Van.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def van_params
    params.require(:van).permit(:van_kind_id, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, :seats, :train_id, :type)
  end


end
