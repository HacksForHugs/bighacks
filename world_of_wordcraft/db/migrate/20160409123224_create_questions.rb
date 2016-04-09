class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question_text
      t.string :correct_answer_id
      t.integer :num_correct
      t.integer :num_incorrect
      t.integer :type
      t.references :user, index:true, foreign_key:true
      t.timestamps null: false
    end
  end
end
