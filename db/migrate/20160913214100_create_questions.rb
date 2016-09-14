class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :body
      t.integer :num_of_op
      t.boolean :need_mul
      t.references :survey, foreign_key: true

      t.timestamps
    end
  end
end
