class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :discord_id
      t.string :nickname

      t.timestamps
    end
  end
end
