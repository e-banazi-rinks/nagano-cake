class AddStatusToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :status, :integer
  end
end
