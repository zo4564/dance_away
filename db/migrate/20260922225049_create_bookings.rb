class CreateBookings < ActiveRecord::Migration[7.2]
  def change
    create_table :bookings do |t|
      t.references :student,
                   null: false,
                   foreign_key: { to_table: :users }

      t.references :lesson,
                   null: false,
                   foreign_key: true

      t.timestamps
    end

    add_index :bookings,
              [:student_id, :lesson_id],
              unique: true
  end
end