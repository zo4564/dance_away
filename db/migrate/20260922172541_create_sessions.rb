class CreateSessions < ActiveRecord::Migration[7.2]
  def change
    create_table :lessons do |t|
      t.references :dance_class, null: false, foreign_key: true
      t.datetime :starts_at
      t.integer :capacity

      t.timestamps
    end
  end
end
