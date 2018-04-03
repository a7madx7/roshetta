class CompanyController < ApplicationController
  before_action :set_company, only: [:show, :edit, :destroy, :update]
  after_action :update_visit_count, only: [:show]

  def index
    @companies = Company.all.paginate(per_page: 6, page: params[:page])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def set_company
      @company = Comapany.find(params[:id])
    end

    def update_visit_count
      @company.visit_count += 1
      @company.save
    end
end
