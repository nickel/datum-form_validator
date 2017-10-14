FROM ruby:2.4
MAINTAINER Juan Gallego IV <juan.gallego.iv@gmail.com>

RUN apt-get update && apt-get install -y git

RUN touch ~/.gemrc && \
  echo "gem: --no-ri --no-rdoc" >> ~/.gemrc && \
  gem install rubygems-update && \
  update_rubygems && \
  gem install bundler && \
  mkdir -p /gem/

WORKDIR /gem/
ADD . /gem/
RUN bundle install

VOLUME .:/gem/

ENTRYPOINT ["bundle", "exec"]
CMD ["rake", "-T"]
