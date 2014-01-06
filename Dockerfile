# DOCKER-RAILS-UNICORN
#
# VERSION       1

FROM yoshiso/rails_base

MAINTAINER yoshiso


ADD supervisor/supervisord.conf /etc/supervisord.conf


#######################################   Rails  #############################################

ENV PATH /usr/local/rbenv/bin:$PATH
ENV RAILS_ENV production

# Git pull latest Rails App
RUN mkdir /var/www; cd /var/www;
RUN git clone https://github.com/yss44/unicorn_sample.git /var/www/app;

# Resolve dependencies
RUN yum -y install sqlite-devel
RUN source /etc/profile.d/rbenv.sh;gem install sqlite3 -v '1.3.8' # Have to be installed
RUN source /etc/profile.d/rbenv.sh;source /etc/profile.d/rbenv.sh;\
    cd /var/www/app;bundle install -j4;

# Setup rails(db:migrate,assets precompile)
RUN source /etc/profile.d/rbenv.sh;source /etc/profile.d/nvm.sh;cd /var/www/app;RAILS_ENV=production bundle exec rake deploy:prepare;

# Add execution file for supervisor
ADD rails/start.sh rails_start.sh
RUN chmod +x rails_start.sh

###################################### Docker config #########################################

ENV WEB_CONCURRENCY 4
ENV RAILS_ENV production

# expose for sshd

EXPOSE 2222 3000

CMD ["/usr/bin/supervisord"]

