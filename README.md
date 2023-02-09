# Mock Hack News Website

## Intruduction
複製一個 mini 的 Hacker News，製作簡易可用的推文系統 prototype：
https://news.ycombinator.com/

主要功能如以下連結說明：
https://gist.github.com/chinghanho/a26bd9982e14fa9ec441cc100db7224d

關於權重計算的部分，設定貼文的`P`為每篇文章的投票數，留言則初始分數為2，`G`設定為1.5
``` bash
權重分數 = (P-1) / (T+2)^G

P = 每篇文章的基礎分數
T = 時間間距，單位為小時
G = 重力係數，文章分數下降的速度
```

## Getting Started
* Version
``` bash
Ruby 3.0.3
Rails 7.0.4
PostgreSQL 14.6
Yarn 1.22.19
jQuery 3.6.3
Bootstrap 5.2.3
Redis 7.0.8
```
* Set Up 
``` bash
belows are the setup steps on mac:

# clone project
git clone https://github.com/iceland101113/origami-gallery.git

# Install redis (有使用到siedkiq會需要用到redis)
brew install redis

# Install yarn (會需要用到uarn build js跟css)
brew install yarn

# Start Redis
redis-server

# Install dependency gem
bundle install

# Install frontend package
yarn install

# Create database schema
rails db:create db:migrate

# Create seed data
rails db:seed

# Start server(跑以下指令，並可至localhost:3000查看)
bin/dev
