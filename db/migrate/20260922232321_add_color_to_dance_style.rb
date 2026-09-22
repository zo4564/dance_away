class AddColorToDanceStyle < ActiveRecord::Migration[7.2]
  def change
    add_column :dance_styles, :color, :string
  end
end