# frozen_string_literal: true

class CreateCards < ActiveRecord::Migration[6.0]
  def up
    create_table :cards do |t|
      t.string :name
      t.string :hp
      t.string :image_url
      t.string :rarity
      t.timestamps
    end
  end

  def down
    drop_table :cards
  end
end
