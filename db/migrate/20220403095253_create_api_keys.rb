class CreateApiKeys < ActiveRecord::Migration[7.0]
  def change
    create_table :api_keys do |t|
      t.string :name, null: false
      t.string :key, null: false

      t.timestamps
    end
  end
end
