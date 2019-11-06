class CreateMapping < ActiveRecord::Migration[5.1]
  def change
    create_table :mappings do |t|
      t.string  :mapping_str

      t.timestamps
    end
  end
end
