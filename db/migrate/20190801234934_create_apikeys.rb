# frozen_string_literal: true

# APIKeys
class CreateApikeys < ActiveRecord::Migration[6.0]
  def change
    create_table :apikeys do |t|
      t.text :key
      t.string :name

      t.timestamps
    end
  end
end
