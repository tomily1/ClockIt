# frozen_string_literal: true

class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string   :name
      t.string   :email, null: false
      t.index    :email

      t.timestamps
    end
  end
end
