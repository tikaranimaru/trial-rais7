# Rails7を試してみる

https://edgeguides.rubyonrails.org/7_0_release_notes.html


## Rail7をインストール
```bash
$ mkdir trial-rais7
$ cd trial-rais7/

# rubyのバージョンを2.7以上にする
$ rbenv local 2.7.2 
$ ruby -v
ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin19]

$ touch Gemfile
```

Gemfileを以下のように作成する

```txt:Gemfile
source "https://rubygems.org"
ruby "2.7.2"
gem "rails", "~> 7.0.0"
```


```bash
$ bundle install

$ rails -v
Rails 7.0.0
```

## Rails7プロジェククトを構築

```bash
# mysql2のインストールが落ちることがあるので、パスを通しておくのが吉
$ bundle config --local build.mysql2 --with-opt-dir="$(brew --prefix openssl)"

# 今回はmysqｌとtailwindを使う
$ rails new . --css=tailwind --database=mysql --force

$ rails db:create
$ rails db:migrate
```

## 起動

```bash
$ rails s
* Puma version: 5.5.2 (ruby 2.7.2-p137) ("Zawgyi")
*  Min threads: 5
*  Max threads: 5
*  Environment: development
*          PID: 9571
* Listening on http://127.0.0.1:3000
* Listening on http://[::1]:3000
Use Ctrl-C to stop
```

## daisy UIをインストール
https://daisyui.com/

```bash
# daisyuiをインストール
$ yarn add daisyui
```

```js:config/tailwind.config.js
const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  :
  :
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('daisyui'),    // ← 追記する
  ],
}

```

[テーマ](https://daisyui.com/docs/default-themes)を設定する

```erb:app/views/layouts/application.html.erb
<html data-theme="retro" >  // data-theme="retro" でテーマを選ぶ
  <head>
    :
  </head>

  <body>
    :   
  </body>
</html>

```

## model(ページ)を作ってみる

```bash
$ rails g scaffold kind name:string
$ rails g scaffold food name:string kind:references price:integer memo:text is_deleted:boolean deleted_at:datetime

$ rails db:migrate

# foremanで起動する
$ foreman start -f Procfile.dev
11:38:01 web.1  | started with pid 9947
11:38:01 css.1  | started with pid 9948
11:38:02 web.1  | => Booting Puma
11:38:02 web.1  | => Rails 7.0.0 application starting in development 
11:38:02 web.1  | => Run `bin/rails server --help` for more startup options
11:38:02 web.1  | Puma starting in single mode...
11:38:02 web.1  | * Puma version: 5.5.2 (ruby 2.7.2-p137) ("Zawgyi")
11:38:02 web.1  | *  Min threads: 5
11:38:02 web.1  | *  Max threads: 5
11:38:02 web.1  | *  Environment: development
11:38:02 web.1  | *          PID: 9947
11:38:02 web.1  | * Listening on http://127.0.0.1:3000
11:38:02 web.1  | * Listening on http://[::1]:3000
11:38:02 web.1  | Use Ctrl-C to stop

```
## 参考
https://edgeguides.rubyonrails.org/getting_started.html

https://rajeevkannav.com/post/2021-03-19-install-rails7-alpha-edge/

https://qiita.com/suketa/items/837eb97bdb48dd8c4688
