class StudyTimesController < ApplicationController
  def index
    @study_times = StudyTime.all

    @total_study_time_today = @study_times.where(date: Date.today).sum(:study_time)
    @total_study_time = @study_times.sum(:study_time)

    # 1週間の学習時間を取得
    @weekly_study_time = (0..6).map do |i|
      @study_times.where(date: Date.today.beginning_of_week(:monday) + i.days).sum(:study_time)
    end
  end
end
