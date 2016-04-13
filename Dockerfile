FROM plone_one

RUN git clone https://github.com/hocinebendou/bika.in.docker /bika.lims \
 && git clone https://github.com/hocinebendou/bika.health.git /bika.health

RUN git clone https://github.com/rockfruit/bika.sanbi.git /bika.sanbi

COPY buildout.cfg /plone/instance/buildout.cfg

RUN chown -R plone:plone /plone /data /bika.lims /bika.health /bika.sanbi \
 && cd /plone/instance \
 && sudo -u plone bin/buildout

RUN ls

VOLUME /data/filestorage /data/blobstorage

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

EXPOSE 8080
USER plone
WORKDIR /plone/instance

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
