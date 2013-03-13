class ActsController < ApplicationController
  def index
    @acts = Act.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @acts }
    end
  end

  def create
    @act = Act.new(params[:act])

    respond_to do |format|
      if @act.save
        format.json { render json: @act, status: :created, location: @act }
      else
        format.json { render json: @act.errors, status: :unprocessable_entity }
      end
    end
  end
end
