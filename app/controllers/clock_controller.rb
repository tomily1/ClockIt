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

  def destroy
    clock = Clock.find_by_id(params[:id])
    clock.destroy
    redirect_to clock_index_path
  end
end
