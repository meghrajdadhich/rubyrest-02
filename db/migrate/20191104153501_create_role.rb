class CreateRole < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string  :role_str

      t.timestamps
    end
  end
end
