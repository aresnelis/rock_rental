class RenameUserStatusColumnToHost < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :status, :host
  end
end
