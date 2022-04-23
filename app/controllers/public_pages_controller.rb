class PublicPagesController < ApplicationController
  def home
    @selected_item = 0
  end

  def facility
    @selected_item = 1
  end

  def market
    @selected_item = 2
  end

  def dahwa
    @selected_item = 3
  end

  def quiz
    @selected_item = 4
  end

  def calendar
    @selected_item = 5
  end

  def halal
    @selected_item = 6
  end
end
