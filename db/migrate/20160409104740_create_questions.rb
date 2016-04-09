class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :type
      t.string :question_text
      t.integer :num_correct
      t.integer :num_incorrect
      t.timestamps null: false
    end
  end
end
