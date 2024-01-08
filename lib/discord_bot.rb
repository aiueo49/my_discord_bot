require 'discordrb'

# bot = Discordrb::Bot.new token: Rails.application.credentials.discord[:bot_token]
bot = Discordrb::Commands::CommandBot.new(token: Rails.application.credentials.discord[:bot_token], prefix: '!')



# botを入室させる
bot.command(:join) do |event|
  channel = event.user.voice_channel
  next "ボイスチャンネルに参加していません。" unless channel
  bot.voice_connect(channel)
  "ボイスチャンネルに参加しました。"
end

# botの現在のチャンネルを表示する
bot.command(:channel) do |event|
  voice_bot = event.bot.voice(event.server.id)
  if voice_bot
    "現在接続しているボイスチャンネルは #{voice_bot.channel.name} です。"
  else
    "ボイスチャンネルに接続していません。"
  end
end

# サーバーIDを表示する
bot.command(:server_id) do |event|
  "現在のサーバーIDは #{event.server.id} です。"
end

# ユーザーが入室したら現在の時間を表示する
bot.voice_state_update do |event|
  if event.channel # ユーザーが部屋に入室した場合
    event.server.text_channels.first.send_message("現在の時間は #{Time.now} です")
  end
end

# ユーザーが入室したらユーザーIDとニックネームを表示する
bot.voice_state_update do |event|
  if event.channel # ユーザーが部屋に入室した場合
    user_id = event.user.id
    nickname = event.user.on(event.server).nick || event.user.name
    event.server.text_channels.first.send_message("ユーザーID: #{user_id}, ニックネーム: #{nickname}がボイスチャンネルに参加しました。")
  end
end

# 学習記録をつける
# ユーザーの入室時間を保存するハッシュ
user_join_times = {}

# bot.voice_state_update do |event|
#   if event.channel && !user_join_times[event.user.id] # ユーザーが部屋に入室した場合
#     user_join_times[event.user.id] = {join_time: Time.now, date: Date.today}
#   elsif !event.channel && user_join_times[event.user.id] # ユーザーが部屋を退出した場合
#     join_time = user_join_times[event.user.id][:join_time]
#     date = user_join_times[event.user.id][:date]
#     leave_time = Time.now
#     study_time = leave_time - join_time
#     formatted_study_time = Time.at(study_time).utc.strftime("%H時間%M分%S秒")
#     event.server.text_channels.first.send_message("#{event.user.name}さんの学習時間は #{formatted_study_time} です")
#     StudyTime.create(user_id: event.user.id, study_time: study_time, date: date)
#     user_join_times.delete(event.user.id)
#   end
# end

bot.voice_state_update do |event|
  if event.channel && !user_join_times[event.user.id] # ユーザーが部屋に入室した場合
    user_join_times[event.user.id] = {join_time: Time.now, date: Date.today}
    nickname = event.user.on(event.server).nick || event.user.name
    puts "#{nickname}がボイスチャンネルに参加しました。"

    # ユーザーのニックネームをデータベースで更新
    user = User.find_or_create_by(discord_id: event.user.id)
    user.update(nickname: nickname)
  elsif !event.channel && user_join_times[event.user.id] # ユーザーが部屋を退出した場合
    join_time = user_join_times[event.user.id][:join_time]
    date = user_join_times[event.user.id][:date]
    leave_time = Time.now
    study_time = leave_time - join_time
    formatted_study_time = Time.at(study_time).utc.strftime("%H時間%M分%S秒")
    event.server.text_channels.first.send_message("#{event.user.name}さんの学習時間は #{formatted_study_time} です")

    # ユーザーの学習時間をデータベースで更新
    user = User.find_by(discord_id: event.user.id.to_i)
    study_time_record = user.study_times.find_by(date: date)
    if study_time_record
      study_time_record.update(study_time: study_time_record.study_time + study_time)
    else
      user.study_times.create(study_time: study_time, date: date)
    end

    user_join_times.delete(event.user.id)
  end
end

bot.run
