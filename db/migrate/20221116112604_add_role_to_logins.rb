class AddRoleToLogins < ActiveRecord::Migration[7.0]
  def change
    add_column :logins, :role, :string
  end
end
