require 'sunspot'

class API::V1::IdAssociationController < ApplicationController
  def show
    result = Association.find_by(id_association: id_params[:id])

    if result.nil?
      render json: { message: 'no results found' }, status: 404
    else
      render json: { association: result }, status: 200
    end
  end

  private

  def id_params
    params.permit(:id)
  end
end
