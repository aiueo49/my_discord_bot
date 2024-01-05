require 'discordrb'

# bot = Discordrb::Bot.new token: Rails.application.credentials.discord[:bot_token]
bot = Discordrb::Commands::CommandBot.new(token: Rails.application.credentials.discord[:bot_token], prefix: '!')

# # メッセージを受け取ったら、返信する
# bot.message(content: '!ping') do |event|
#   event.respond 'Pong!'
# end

# bot.command(:join) do |event, channel_id|
#   channel = bot.channel(channel_id.to_i)
#   if channel.nil?
#     "指定したIDのチャンネルが見つかりませんでした。"
#   else
#     bot.voice_connect(channel)
#     "#{channel.name} チャンネルに接続しました。"
#   end
# end

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

bot.voice_state_update do |event|
  if event.channel # ユーザーが部屋に入室した場合
    event.server.text_channels.first.send_message("現在の時間は #{Time.now} です")
  end
end

# 学習記録をつける
# ユーザーの入室時間を保存するハッシュ
user_join_times = {}

bot.voice_state_update do |event|
  if event.channel && !user_join_times[event.user.id] # ユーザーが部屋に入室した場合
    user_join_times[event.user.id] = Time.now
  elsif !event.channel && user_join_times[event.user.id] # ユーザーが部屋を退出した場合
    join_time = user_join_times[event.user.id]
    leave_time = Time.now
    study_time = leave_time - join_time
    event.respond "学習時間は #{study_time.round} 秒です"
    user_join_times.delete(event.user.id)
  end
end

bot.run
