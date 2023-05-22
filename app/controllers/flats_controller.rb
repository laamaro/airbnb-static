require "open-uri"

class FlatsController < ApplicationController
  before_action :set_flats

  def index
    if params[:flat_name]
      @flats = @flats.select {|flat| flat["name"] == params[:flat_name]}
    end
  end

  def show
    @flat = @flats.find {|flat| flat["id"] == params[:id].to_i }
  end

  def set_flats
    url = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"
    @flats = JSON.parse(URI.open(url).read)
  end
end
