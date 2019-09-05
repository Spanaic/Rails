class TodolistsController < ApplicationController
  def new
    @list = List.new
  end

  def create

    list = List.new(list_params)

    list.save

    redirect_to '/top'
  end
  private

  def list_params
      params.require(:lists).permit(:title, :body)
  end
  
end
