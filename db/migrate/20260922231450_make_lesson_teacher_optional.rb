class MakeLessonTeacherOptional < ActiveRecord::Migration[7.2]
  def change
    change_column_null :lessons, :teacher_id, true
  end
end