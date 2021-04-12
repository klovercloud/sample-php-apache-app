FROM klovercloud/php-7.3.20-apache2-base-image:v1.0.0

WORKDIR $TEMP_APP_HOME

COPY ./app/. .

RUN chmod +x init.sh
RUN sed -i 's/\r$//' init.sh

EXPOSE 8080
WORKDIR $APP_HOME
USER klovercloud