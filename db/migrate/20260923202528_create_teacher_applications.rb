class CreateTeacherApplications < ActiveRecord::Migration[7.2]
  def change
    create_table :teacher_applications do |t|
      t.references :teacher,
                   null: false,
                   foreign_key: { to_table: :users }

      t.references :lesson,
                   null: false,
                   foreign_key: true

      t.string :status,
               null: false,
               default: "pending"

      t.timestamps
    end

    add_index :teacher_applications,
              [:teacher_id, :lesson_id],
              unique: true

    add_check_constraint :teacher_applications,
                         "status IN ('pending', 'accepted', 'rejected')",
                         name: "teacher_applications_status_check"
  end
end