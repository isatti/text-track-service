FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /text-track-service
WORKDIR /text-track-service
COPY Gemfile /text-track-service/Gemfile
COPY Gemfile.lock /text-track-service/Gemfile.lock
RUN bundle install
COPY . /text-track-service

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
EXPOSE 7419
EXPOSE 7420

# Start the main process.
#CMD ["rails", "server", "-b", "0.0.0.0"]
#CMD ["ruby", "/text-track-service/text-track-service.rb"]
#CMD ["ruby", "/text-track-service/text-track-worker.rb"]