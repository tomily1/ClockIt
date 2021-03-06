# frozen_string_literal: true

class CreateClock < ActiveRecord::Migration[5.1]
  def change
    create_table :clocks do |t|
      t.string      :type, null: false
      t.column      :clocked_at, 'timestamp with time zone'
      t.text        :details
      t.references  :user, foreign_key: true, null: false, index: true

      t.timestamps
    end
  end
end
