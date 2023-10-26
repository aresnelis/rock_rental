class ChangeTypeColumnNameInRocks < ActiveRecord::Migration[7.0]
  def change
    rename_column :rocks, :type, :rock_type
  end
end
