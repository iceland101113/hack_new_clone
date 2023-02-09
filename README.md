# Mock Hack News Website

主要功能如下


#### Getting Started
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
# clone project
git clone https://github.com/iceland101113/origami-gallery.git

# Install dependencies
安裝redis，有使用到siedkiq會需要用到redis
brew install redis

安裝yarn，會需要用到uarn build js跟css
brew install yarn

bundle install

# Create database schema
rails db:create db:migrate

# Create seed data
rails db:seed

#Start server
跑以下指令，並可至localhost:3000查看
bin/dev
