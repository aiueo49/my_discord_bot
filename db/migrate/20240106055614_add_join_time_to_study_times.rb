class AddJoinTimeToStudyTimes < ActiveRecord::Migration[7.1]
  def change
    add_column :study_times, :join_time, :datetime
  end
end
