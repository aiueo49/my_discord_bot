class StudyTimesController < ApplicationController
  def index
    @study_times = StudyTime.all
  end
end
