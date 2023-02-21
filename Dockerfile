FROM odoo:11.0

WORKDIR /home/app



RUN pip install -r requirements.txt


EXPOSE 8069

# ENTRYPOINT ["/entrypoint.sh"]
# CMD ["odoo", "-c/etc/odoo/odoo.conf"]