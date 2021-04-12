FROM klovercloud/php-7.3.20-apache2-base-image:v1.0.0

WORKDIR $TEMP_APP_HOME

COPY ./app/. .

RUN chmod +x init.sh
RUN sed -i 's/\r$//' init.sh

#For Apache Log Aggregation
RUN sed -i -r 's@ErrorLog .*@ErrorLog /dev/stderr@i' /etc/apache2/apache2.conf
RUN echo "TransferLog /dev/stdout" >> /etc/apache2/apache2.conf
RUN echo "CustomLog /dev/stdout combined" >> /etc/apache2/apache2.conf
RUN sed -i -r 's@ErrorLog .*@ErrorLog /dev/stderr@i' /etc/apache2/sites-available/000-default.conf
RUN sed -i -r 's@CustomLog .*@CustomLog /dev/stdout combined@i' /etc/apache2/sites-available/000-default.conf
RUN sed -i -r 's@ErrorLog .*@ErrorLog /dev/stderr@i' /etc/apache2/sites-enabled/000-default.conf
RUN sed -i -r 's@CustomLog .*@CustomLog /dev/stdout combined@i' /etc/apache2/sites-enabled/000-default.conf

EXPOSE 8080
WORKDIR $APP_HOME
USER klovercloud