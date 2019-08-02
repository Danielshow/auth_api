class CreatePublicAssets < ActiveRecord::Migration[6.0]
  def change
    create_table :public_assets do |t|
      t.string :asset_type
      t.string :key
      t.text :value

      t.timestamps
    end
  end
end
