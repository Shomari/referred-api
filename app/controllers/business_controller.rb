class BusinessController < ApplicationController

  def index
    cat = Category.find_by(name: params[:category])
    biz = Business.where(category_id: cat.id, zipcode: params[:zipcode])
    render json: biz
  end


  def show_by_buid
    biz = Business.find params[:id]
    render json: biz
  end
end
