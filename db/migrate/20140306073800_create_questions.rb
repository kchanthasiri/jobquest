class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.text :question_title
    	t.text :question_body
      t.integer :user_id
      t.timestamps
    end
  end
end
