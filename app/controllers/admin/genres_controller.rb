class Admin::GenresController < ApplicationController
  before_action :authenticate_customer!
  def index
  end

  def edit
  end
end
