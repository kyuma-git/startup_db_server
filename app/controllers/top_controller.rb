class TopController < ApplicationController
  def index
    @latest = Company.latest
    @hot = Company.hot
  end
end
