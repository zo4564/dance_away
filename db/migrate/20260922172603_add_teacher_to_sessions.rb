class AddTeacherToSessions < ActiveRecord::Migration[7.2]
  def change
    add_reference :lessons, :teacher, foreign_key: { to_table: :users }
  end
end
