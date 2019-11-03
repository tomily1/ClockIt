class ClockDatatable < AjaxDatatablesRails::Base

  def view_columns
    @view_columns ||= {
      id: { source: "Clock.id", cond: :eq },
      type: { source: "Clock.type", cond: :like },
      clocked_at: { source: "Clock.clocked_at", cond: :like },
      details: { source: "Clock.details", cond: :like }
    }
  end

  def edit_record_path(clock)
    Rails.application.routes.url_helpers
  end

  def delete_record_path(clock)
    Rails.application.routes.url_helpers.clock_path(clock.id)
  end

  def data
    records.map do |record|
      {
        id: record.id,
        type: record.type.split('::').join(' '),
        clocked_at: record.clocked_at.strftime("%m/%d/%Y at %I:%M%p"),
        details: record.details,
        delete_record: delete_record_path(record)
      }
    end
  end

  def clocks
    @clocks ||= options[:clocks]
  end

  private

  def get_raw_records
    clocks
  end
end
