# README

## ■サービス概要

Discordのチャットルームに

入退室するだけで

学習記録をつけることができるアプリケーション。


## ■ このサービスへの思い・作りたい理由
RUNTEQに入学して、Discordが学習環境として提供されていることを知る。

コミュニケーションの練習も兼ねてRUNTEQに入学した自分の心情として、Discordを活用しない手はないと思った。

入学してから、それなりに高い頻度でDiscordの同期部屋に入室して学習をするも、なかなか同期生と一緒に勉強する機会を得られなかった。

そんな中、後輩の50期生が入学。彼らのルームは毎日人で溢れており、ひとりぼっちの私にはその盛り上がりが羨ましかった。

なんとか同期とDiscordでお話ししながら学習がしたい！と思った私は、解決策はないものか考えた。


その頃、RUNTEQの校長先生が「POISON」というDiscordを活用したアプリケーションを作成なさったことをYOUTUBEで拝聴。

「Discordにもプログラミングを活かすことができる」ということを知る。


また同じ頃、とある問題に直面していた。

日々の学習記録をつけることがめんどくさく感じてきたのだ。

ストップウォッチ機能を搭載したスマートフォンのアプリケーションを利用し、毎日の学習の記録をつけてはいるのだが、

スタートボタンを押し忘れたり、ストップボタンを押し忘れたり・・・ということがしばしば起こった。

もっと楽に学習時間を記録できたらいいのに・・・。


そしてアイディアが降ってきた。

「Discordに入室するだけで学習時間を記録できるサービスを作ればいいじゃないか」


こうして私のアプリケーション開発の幕が上がった。


## ■ ユーザー層について
ユーザー層は、RUNTEQ49期生。ひいてはRUNTEQ生。

理由は、同期生と毎日学習したりおしゃべりしたりしたいから。

他の期の受講生もそう思っている人がいるかもしれないのでRUNTEQ生全員を対象としても良いかもしれない。


## ■サービスの利用イメージ
Discordのボイスチャットルームに入退室することで入室時間と退出時間の差が、学習時間として記録される。

週1回のRUNTEQ Reportやユーザーの日報で学習時間を記載している方は、記録が楽になる。

また、学習時間を記録するにはDiscordに入室することが条件なのでDiscordを利用する機会が増える。

ひいては学習習慣の確立につながる。


## ■ ユーザーの獲得について
私が作成したDiscord botをバーチャルRUNTEQへの導入してもらえるようRUNTEQ運営陣に掛け合う。


## ■ サービスの差別化ポイント・推しポイント
今検索してみると似たようなサービスが存在していた。

それもRUNTEQ生。

URLにアクセスできなかったので現在は稼働していないのかもしれない。

現在も稼働していると考えて、差別化ポイントを考える。


差別化ポイントは、RUNTEQのカリキュラム一覧を取り入れ、各カリキュラムにおいての学習時間も記録できるようにする点。

カリキュラム以外のカテゴライズとして「チーム開発」「イベント」なども実装する。


また、何の「プログラミング言語」を学習したのかの記録もつけられる点も差別化ポイントとして採用したい。


## ■ 機能候補

### MVPリリース時に作っていたいもの

#### Discordチャンネルへの入退出をトリガーとした学習記録機能
1. **Discord Botの実装**
   - Discord APIを使用したBotの作成
   - チャンネル入退出時のイベントを監視する機能の実装
2. **学習時間の記録**
   - ユーザーごとの学習時間を記録するデータベースの設計（ユーザーID、ニックネーム、入室時間、退室時間、学習時間）
   - 入室時、ユーザーIDとニックネームを取得する機能の実装
   - 入退出時のタイムスタンプを取得する機能の実装
   - 入退室時間の差を計算し、差を学習時間として算出する機能の実装
3. **botによるチャットの表示**
   - 入退室時に定型文を自動で表示する機能の実装
    - 入室時(例)「(ユーザー名)さん、おはようございます。今日も頑張りましょう」
    - 退室時(例)「(ユーザー名)さん、お疲れ様でした。学習時間は〇〇時間〇〇分〇〇秒です」

#### Discordの認証機能を用いたユーザーのログイン
1. **Discord OAuth2.0の実装**
   - DiscordのOAuth2.0を利用したログイン機能の実装
   - ユーザーとDiscordアカウントの関連付け
2. **ユーザーデータの管理**
   - ログインユーザーの情報を管理するデータベースの設計
   - ユーザー情報の保存、管理、表示機能の実装


#### 学習記録を表でまとめたWebページ
1. **学習時間の集計**
   - ユーザーごとの学習時間を集計し、合計時間を算出する機能の実装
2. **Webページの作成**
   - ユーザーごとの学習時間を表示するWebページの作成
   - 各ユーザーの学習時間を表形式で表示する機能の実装
   - その日の学習時間の合計を表示
    - 毎日の学習時間をカレンダー形式で表示
    - 毎週の合計がカレンダーの1カラムとして存在(週ごとの学習時間の表示)
    - 今までの累積時間の表示


### 本リリースまでに作っていたいもの

#### 学習記録の詳細画面（日毎）
1. **日毎の学習記録の表示**
 - カレンダー形式の任意の日を選択すると詳細画面に遷移する機能の実装
 - 詳細画面には、以下を表示する。
   - RUNTEQカリキュラムの何を勉強したか
   - カリキュラム以外の勉強の場合を考慮し「チーム開発」や「イベント」「書籍」などの選択肢も用意する
   - 言語は何を勉強したか
     - カリキュラムはこちらで既に言語を割り当てておく。ユーザーの自主的な学習についてはカスタムできるような機能を実装
     - 円グラフ、もしくはGithubのような横向きの棒グラフで実装

※詳細画面を作成せず、代えてカレンダー上の日付にホバーした時に吹き出しのような形式で以上の内容を表示させるほうが、ページ遷移を伴わない分ユーザーの負担は減るのでこちらを採用する可能性あり。



## ■ 機能の実装方針予定
・Discord APIを使用したログイン機能の実装


## ■ ER図
[![Image from Gyazo](https://i.gyazo.com/4cfd243e31a3b5a27981b4f0677c3dac.png)](https://gyazo.com/4cfd243e31a3b5a27981b4f0677c3dac)
