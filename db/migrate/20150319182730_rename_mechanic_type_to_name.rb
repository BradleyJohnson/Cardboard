class RenameMechanicTypeToName < ActiveRecord::Migration
  def change
    rename_column(:mechanics, :type, :mechanic_type)
  end
end
