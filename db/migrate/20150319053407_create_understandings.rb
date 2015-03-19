class CreateUnderstandings < ActiveRecord::Migration
  def change
    create_table :understandings do |t|
      t.integer :user_id
      t.integer :subject_id
      t.integer :level

      t.timestamps
    end
  end
end
