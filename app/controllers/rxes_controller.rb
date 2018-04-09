class RxesController < ApplicationController
  before_action :set_rx, only: [:show, :edit, :update, :destroy]

  # GET /rxes
  # GET /rxes.json
  def index
    @rxes = Rx.all
  end

  # GET /rxes/1
  # GET /rxes/1.json
  def show
    require 'rqrcode'
    qr = RQRCode::QRCode.new(rx_url(@rx))
    png = qr.as_png(
          resize_gte_to: false,
          resize_exactly_to: false,
          fill: 'grey',
          color: 'black',
          size: 120,
          border_modules: 4,
          module_px_size: 6,
          file: "#{Rails.root}/app/assets/images/rx_code.png"
          )
  end

  # GET /rxes/new
  def new
    @rx = Rx.new
  end

  # GET /rxes/1/edit
  def edit
  end

  # POST /rxes
  # POST /rxes.json
  def create
    @rx = Rx.new(rx_params)

    respond_to do |format|
      if @rx.save
        format.html { redirect_to @rx, notice: 'Rx was successfully created.' }
        format.json { render :show, status: :created, location: @rx }
      else
        format.html { render :new }
        format.json { render json: @rx.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rxes/1
  # PATCH/PUT /rxes/1.json
  def update
    respond_to do |format|
      if @rx.update(rx_params)
        format.html { redirect_to @rx, notice: 'Rx was successfully updated.' }
        format.json { render :show, status: :ok, location: @rx }
      else
        format.html { render :edit }
        format.json { render json: @rx.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rxes/1
  # DELETE /rxes/1.json
  def destroy
    @rx.destroy
    respond_to do |format|
      format.html { redirect_to rxes_url, notice: 'Rx was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rx
      @rx = Rx.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rx_params
      params.require(:rx).permit(:expires_at, :total_value, :dispensed_count, :patient_id, :short_diagnosis, :full_diagnosis, :allowed_dispense_count, :status, :visibility, :picture, :expired, :professional_comment, :starts_at)
    end
end
