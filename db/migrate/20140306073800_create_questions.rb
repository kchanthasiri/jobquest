class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.text :title
    	t.text :details
    	t.string :user
    	t.string :job
    	t.string :firm
    	t.string :category
      t.integer :userid
      t.timestamps
    end
  end
end
