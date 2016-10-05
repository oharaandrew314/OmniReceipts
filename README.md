# Omni Receipts

[![Build Status](https://travis-ci.org/oharaandrew314/OmniReceipts.svg?branch=master)](https://travis-ci.org/oharaandrew314/OmniReceipts)

## Setup Development Environment

### Ubuntu Linux 16.04

```bash
$ sudo apt install git ruby ruby-dev ruby-railties zlib1g-dev sqlite libsqlite3-dev nodejs
```

Verify with `ruby -v` that you have at least ruby 2.3 installed.

```bash
$ mkdir ~/workspace
$ cd ~/workspace
$ git clone https://github.com/oharaandrew314/OmniReceipts.git
$ cd OmniReceipts
$ bundle install --path .bundle
$ rake db:migrate
```

    
Create your `config/secrets.yml` and replace the placeholders marked by `< >`

```yml
development:
  secret_key_base: <generate with rake secret>
  google_client_id: <google_client_id>
  google_client_secret: <google_client_secret>

test:
  secret_key_base: <generate with rake secret>

production:
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
```

```bash
$ rails s
```
