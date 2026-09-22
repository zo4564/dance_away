class CreateLessons < ActiveRecord::Migration[7.2]
  def change
    create_table :lessons do |t|
      t.references :dance_class, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: { to_table: :users }
      t.datetime :starts_at, null: false
      t.integer :capacity, null: false

      t.timestamps
    end

    add_check_constraint :lessons,
                         "capacity > 0",
                         name: "lessons_capacity_positive"
  end
end