class CompanyController < ApplicationController
  def index
    @companies = Company.all.paginate(per_page: 6, page: params[:page])
    @drugs = Drug.all
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
end
