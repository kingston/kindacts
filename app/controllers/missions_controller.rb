class MissionsController < ApplicationController
  def index
    @missions = Mission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @missions }
    end
  end
end
