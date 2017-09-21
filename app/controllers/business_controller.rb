class BusinessController < ApplicationController
  def show_by_buid
    biz = Business.find params[:id]
    render json: biz
  end
end
