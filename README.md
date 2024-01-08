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
ユーザー層

RUNTEQ49期生。ひいてはRUNTEQ生。

理由

同期生と毎日学習したりおしゃべりしたりしたいから。

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
【MVPリリース時に作っていたいもの】

・Discordチャンネルへの入退室をトリガーとし、ユーザーごとに学習記録をつける機能。

・学習記録を表でまとめたWebページ。


【本リリースまでに作っていたいもの】

・Discordの認証機能を用いたユーザーのログイン機能

・学習記録の詳細画面（日毎）



## ■ 機能の実装方針予定
・Discord APIを使用したログイン機能の実装

