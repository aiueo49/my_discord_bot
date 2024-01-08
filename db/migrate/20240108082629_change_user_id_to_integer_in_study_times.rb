class ChangeUserIdToIntegerInStudyTimes < ActiveRecord::Migration[7.1]
  def up
    add_column :study_times, :new_user_id, :integer

    StudyTime.all.each do |study_time|
      study_time.update_columns(new_user_id: study_time.user_id.to_i)
    end

    remove_column :study_times, :user_id
    rename_column :study_times, :new_user_id, :user_id
  end

  def down
    add_column :study_times, :new_user_id, :string

    StudyTime.all.each do |study_time|
      study_time.update_columns(new_user_id: study_time.user_id.to_s)
    end

    remove_column :study_times, :user_id
    rename_column :study_times, :new_user_id, :user_id
  end
end
