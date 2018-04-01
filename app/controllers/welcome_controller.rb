class WelcomeController < ApplicationController
  def home
    @drugs = Drug.all
  end
end
