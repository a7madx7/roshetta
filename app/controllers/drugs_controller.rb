class DrugsController < ApplicationController
  # expose :drug
  # expose :drugs, -> { Drug.all }
  before_action :set_drug, only: [:show, :update, :destroy, :edit]

  after_action :update_visit_count, only: [:show]
  after_action :update_image, only: [:show]

  # GET /drugs
  # GET /drugs.json
  def index
    @drugs = Drug.all
    respond_to do |format|
      format.html { }
      format.json { }
    end
  end

  # GET /drugs/1
  # GET /drugs/1.json
  def show; end

  # GET /drugs/new
  def new; end

  # GET /drugs/1/edit
  def edit; end

  # POST /drugs
  # POST /drugs.json
  # @return [nil]
  def create
    respond_to do |format|
      if drug.save
        format.html { redirect_to drug, notice: 'Drug was successfully created.' }
        format.json { render :show, status: :created, location: drug }
      else
        format.html { render :new }
        format.json { render json: drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drugs/1
  # PATCH/PUT /drugs/1.json
  def update
    respond_to do |format|
      if drug.update(drug_params)
        format.html { redirect_to drug, notice: 'Drug was successfully updated.' }
        format.json { render :show, status: :ok, location: drug }
      else
        format.html { render :edit }
        format.json { render json: drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drugs/1
  # DELETE /drugs/1.json
  def destroy
    drug.destroy
    respond_to do |format|
      format.html { redirect_to drugs_url, notice: 'Drug was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def drug_params
    params.require(:drug).permit(:name, :price, :company, :market_available, :professional_comment, :invented_at, :market_status)
  end

  def update_visit_count
    drug.visit_count += 1
    drug.save
  end

  def update_image
    images_folder = Rails.root.to_s + '/app/assets/images/downloads'
    return unless create_dir
    drug_name = drug.name_without_suffix
    get_images_for(drug_name, images_folder, 5, 'png')

    Dir.foreach(images_folder + '/' + "#{drug_name}/") do |file|
      next if (file == '.') || (file == '..')
      drug.image = file
    end
    drug.save
  end

  def set_drug
    @drug = Drug.where(id: params[:id]).first
  end
end
