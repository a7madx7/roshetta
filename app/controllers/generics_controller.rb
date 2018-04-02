class GenericsController < ApplicationController
  before_action :set_drug, only: [:show, :edit, :destroy, :update]
  after_action :update_visit_count, only: [:show]

  def show
  end
  
  def new
  end

  def create
  end

  def index
  end

  def update
  end

  def edit
  end

  def destroy
  end


  private

    def generic_params
      params.require(:generic).permit(:name)
    end
    def set_generic
      @generic = Generic.find(params[:id])
    end
    def update_visit_count
      @generic.visit_count += 1 
      @generic.save
    end
end
