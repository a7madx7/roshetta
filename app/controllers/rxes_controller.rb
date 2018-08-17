class RxesController < ApplicationController
  before_action :set_rx, only: [:show, :edit, :update, :destroy, :like, :dislike]

  # GET /rxes/new
  def new
    # todo: find a better way to remove unfinished rxes.
    session[:rx_step] = session[:rx_params] = nil

    session[:rx_params] ||= {}
    session[:rx_step] ||= 'initial'
    @rx = Rx.new(session[:rx_params])
    @rx.current_step = session[:rx_step]
    @rx.issuer_id = current_user.id
  end

  # GET /rxes
  # GET /rxes.json
  def index
    @rxes = Rx.all
    authorize! :read, @rxes
  end

  # GET /rxes/1
  # GET /rxes/1.json
  def show
    authorize! :read, @rx
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

  # GET /rxes/1/edit
  def edit
    authorize! :edit, @rx
  end

  # POST /rxes
  # POST /rxes.json
  def create
    # authorize! :create, @rx
  
    session[:rx_params].deep_merge!(rx_params) if rx_params
    @rx = Rx.new(session[:rx_params])

    @rx.current_step = session[:rx_step]
    if @rx.valid?
      if params[:back_button]
        @rx.previous_step
      elsif @rx.last_step?
        @rx.save if @rx.all_valid?
      else
        #Fix: on refresh goes to next step
        @rx.next_step
      end
      session[:rx_step] = @rx.current_step
    end
    if @rx.new_record?
      render :new
    else
      session[:rx_step] = session[:rx_params] = nil
      flash[:notice] = 'Prescription was issued successfuly!'
      redirect_to @rx
    end
  end

  # PATCH/PUT /rxes/1
  # PATCH/PUT /rxes/1.json
  def update
    authorize! :update, @rx
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
    authorize! :destroy, @rx
    @rx.destroy
    respond_to do |format|
      format.html { redirect_to rxes_url, notice: 'Rx was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # like/unlike in the same action
  def like
    if @rx.liked_by current_user
      @rx.unliked_by current_user
    else
      @rx.liked_by current_user
    end
  end

  def dislike

  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_rx
    @rx = Rx.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def rx_params
    params.require(:rx).permit(:expires_at, :total_value,
                                :dispensed_count, :short_diagnosis, :full_diagnosis,
                                :allowed_dispense_count,:status, :visibility, 
                                :picture, :expired, :professional_comment, :starts_at,
                                patient_attributes: %i[name social_security_id])
  end
end
