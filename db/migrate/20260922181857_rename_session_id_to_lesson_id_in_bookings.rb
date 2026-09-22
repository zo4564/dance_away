class RenameSessionIdToLessonIdInBookings < ActiveRecord::Migration[7.2]
  def change
    rename_column :bookings, :session_id, :lesson_id
  end
end
