# frozen_string_literal: true

class ClockController < ApplicationController
  before_action :authorize_user

  def index
    @clocks = current_user.clocks

    respond_to do |format|
      format.html { render(layout: 'application') }
      format.json do
        begin
          render json: ClockDatatable.new(view_context, clocks: @clocks)
        rescue ArgumentError => e
          render json: { error: e.message }, status: :bad_request
        end
      end
    end
  end

  def new
    @clock_event = Clock.new
  end

  def create
    @clock_event = current_user.clocks.new(
      type: clock_params[:type],
      details: clock_params[:details],
      clocked_at: Time.now
    )

    if @clock_event.save
      redirect_to clock_index_path
    else
      render :new
    end
  end

  def destroy
    clock = Clock.find_by_id(params[:id])
    clock.destroy
    redirect_to clock_index_path
  end

  private

  def clock_params
    params.require(:clock).permit(:details, :type)
  end
end
