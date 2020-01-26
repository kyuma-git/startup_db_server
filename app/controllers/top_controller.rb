class TopController < ApplicationController
  def index
    @latest = Company.latest
  end
end
