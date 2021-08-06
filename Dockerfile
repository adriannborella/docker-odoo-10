FROM ubuntu:18.04

RUN apt update && apt upgrade -y


ENV HOME=/home/app
ENV APP_HOME=$HOME/odoo

RUN mkdir $HOME
RUN mkdir $HOME/addons
RUN mkdir $HOME/logs

RUN apt install -y tzdata
RUN ln -fs /usr/share/zoneinfo/America/Argentina /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN apt install python2.7 git -y
RUN apt install python-pip nano mc -y
RUN apt-get install python-dateutil python-docutils python-feedparser python-jinja2 python-ldap python-libxslt1 python-lxml python-mako python-mock python-openid python-psycopg2 python-psutil python-pychart python-pydot python-pyparsing python-reportlab python-simplejson python-tz python-unittest2 python-vatnumber python-vobject python-webdav python-werkzeug python-xlwt python-yaml python-zsi poppler-utils python-pip python-passlib python-decorator gcc python-dev mc bzr python-setuptools python-markupsafe python-reportlab-accel python-zsi python-yaml python-argparse python-openssl python-egenix-mxdatetime python-usb python-serial lptools make python-pydot python-psutil python-paramiko poppler-utils python-pdftools antiword python-requests python-xlsxwriter python-suds python-psycogreen python-ofxparse python-gevent -y
RUN apt-get install libsasl2-dev python-dev libldap2-dev libssl-dev -y
RUN apt-get install libxml2-dev libxslt-dev python-dev -y
RUN apt-get install -y postgresql-client
RUN apt install wget -y 

RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN tar -xvf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN rm -f /usr/local/bin/wkht* \
        && rm -f /usr/bin/wkht* \
        && cp -r wkhtmltox/bin/* /usr/local/bin/ \
        && cp -r wkhtmltox/bin/* /usr/bin/ 

RUN git clone --depth=1 --branch=10.0 https://github.com/odoo/odoo.git $APP_HOME

WORKDIR $APP_HOME

COPY ./config/odoo.conf /home/app/.odoorc

RUN pip install -r requirements.txt

RUN apt-get install -y npm
RUN npm install -g less@3.0.4 less-plugin-clean-css


EXPOSE 8069

# ENTRYPOINT ["/entrypoint.sh"]
# CMD ["odoo", "-c/etc/odoo/odoo.conf"]
CMD ["bash"]