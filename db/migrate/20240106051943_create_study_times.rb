class CreateStudyTimes < ActiveRecord::Migration[7.1]
  def change
    create_table :study_times do |t|
      t.string :user_id
      t.float :study_time
      t.date :date

      t.timestamps
    end
  end
end
