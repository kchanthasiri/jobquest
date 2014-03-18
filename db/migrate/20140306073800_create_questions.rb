class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.text :question_title
    	t.text :question_body
      	t.belongs_to :user
      	t.timestamps
    end
  end
end
