class CreateBookings < ActiveRecord::Migration[7.2]
  def change
    create_table :bookings do |t|
      t.bigint :student_id
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end

    add_foreign_key :bookings, :users, column: :student_id
    add_index :bookings, [:student_id, :session_id], unique: true
  end
end
