class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.string :heading
      t.integer :num_of_q

      t.timestamps
    end
  end
end
