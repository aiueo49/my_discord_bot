class StudyTimesController < ApplicationController
  def index
    @study_times = StudyTime.includes(:user).all

    # 今日の学習時間を取得
    @total_study_time_today = @study_times.where(date: Date.today).sum(:study_time)

    # 今までの学習時間を全て取得
    @total_study_time = @study_times.sum(:study_time)

    # 1週間の学習時間を取得
    @weekly_study_time = (0..6).map do |i|
      @study_times.where(date: Date.today.beginning_of_week(:monday) + i.days).sum(:study_time)
    end

    # 1週間の学習時間の合計を取得
    @total_study_time_this_week = @weekly_study_time.sum

    # カレンダーを表示するための情報を取得
    # 1. 表示する月の日付範囲を取得
    year = Time.now.year
    month = Time.now.month
    start_date = Date.new(year, month, 1)
    end_date = start_date.end_of_month

    # 2. その範囲内の各日付に対して、その日の学習時間を取得
    study_times = StudyTime.where(date: start_date..end_date)

    # 3. これらの情報を使用してカレンダーを描画
    @calendar = []
    # 月の初日の曜日に合わせて空の日付を追加
    ((start_date.wday - 1) % 7).times { @calendar << { date: nil, study_time: nil } }
    (start_date..end_date).each do |date|
      study_time = study_times.find { |st| st.date == date }
      @calendar << { date: date, study_time: study_time&.study_time }
    end
  end
end
