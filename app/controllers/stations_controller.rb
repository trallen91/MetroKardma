class StationsController < ApplicationController
  def index
    respond_with Station.all
  end
end