class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer  :pri
      t.text  :quiz
      t.string  :teamingStages
      t.integer  :appearsDay
      t.integer  :frequency
      t.string  :qType
      t.string  :required
      t.string  :conditions
      t.references :mapping, foreign_key: true
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
