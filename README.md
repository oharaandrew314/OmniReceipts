# Omni Receipts

## Setup Development Environment (Ubuntu Linux)

```bash
$ sudo apt install git ruby ruby-dev ruby-railties zlib1g-dev sqlite libsqlite3-dev nodejs
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
