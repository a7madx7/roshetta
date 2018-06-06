class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def new
  end

  def index
  end

  def edit
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to root_path, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
  end

  def destroy
  end

  private

    def profile_params
      params.require(:profile).permit(:speciality, :profession, :age,
         :gender, :land_line, :mobile_phone,
         :address)
    end

    def set_profile
      @profile = Profile.find(params[:id])
    end
end
