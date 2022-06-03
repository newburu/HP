# Rubyのバージョン
FROM ruby:2.7.4

# curl -sS でエラー以外の出力の抑制
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# yarn node.jsのインストール(apt-get -yでyes/noを聞かれないようにする必要がある)
RUN apt-get update && \
apt-get install -y yarn nodejs --no-install-recommends && \
rm -rf /var/lib/apt/lists/*

# プロジェクトのディレクトリをコンテナに作成
RUN mkdir /HP

# 作業ディレクトリに↑で作成したディレクトリを指定
WORKDIR /HP

# Gemfileを作業ディレクトリにコピー
ADD Gemfile /HP/Gemfile
ADD Gemfile.lock /HP/Gemfile.lock

# gemのインストール
RUN gem install bundler
RUN bundle install

# プロジェクト本体をコンテナにコピー
ADD . /HP

# コンテナ起動時にRailsサーバーが起動するようにする
CMD ["rails", "server", "-b", "0.0.0.0"]
