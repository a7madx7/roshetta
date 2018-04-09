class WelcomeController < ApplicationController
  before_action :check_profile, only: [:home]
  def home
    @drugs = Drug.all
  end

  private

  def check_profile
    @profile = current_user.profile
    redirect_to edit_profile_path(@profile) unless @profile.complete?
  end
end
