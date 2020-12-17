class RecordsController < ApplicationController

  def index
    @user_order = UserOrder.new
  end

  def create
    binding.pry
  end

end
