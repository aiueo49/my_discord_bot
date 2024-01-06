class StudyTimesController < ApplicationController
  def index
    # @study_times = StudyTime.all
    @study_times = StudyTime.where(date: Date.today)
    @total_study_time_today = @study_times.sum(:study_time)
  end
end
