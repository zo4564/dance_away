class RenameSessionsToLessons < ActiveRecord::Migration[7.2]
  def change
    rename_table :lessons, :lessons
  end
end
