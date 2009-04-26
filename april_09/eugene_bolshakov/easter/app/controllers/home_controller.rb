class HomeController < ApplicationController
  def index
    @easter = EasterDate.new(Time.now.year)
    @next_easter = EasterDate.new(Time.now.year + 1)
  end
end
