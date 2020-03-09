FROM ruby:2.6.5

# Setup server dependencies

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Setup contest grading dependencies for Python, Java, C++, and Haskell (Ruby is already installed on the base image)

RUN wget https://www.python.org/ftp/python/3.6.10/Python-3.6.10.tgz && tar zxf Python-3.6.10.tgz
RUN cd Python-3.6.10 && ./configure && make && make install

RUN wget -qO- https://get.haskellstack.org/ | sh && stack setup

RUN echo "deb http://ftp.us.debian.org/debian sid main" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
	build-essential \
	openjdk-13-jdk

# Setup server

WORKDIR /contest/server

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
