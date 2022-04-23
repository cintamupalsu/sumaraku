class CreateUserRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_roles do |t|
      t.string :content

      t.timestamps
    end
    add_index :user_roles, [:id, :created_at]
  end
end
