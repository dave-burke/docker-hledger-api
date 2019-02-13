FROM voidlinux/voidlinux

MAINTAINER Dave Burke <thoughtcriminall@gmail.com>

RUN xbps-install -Sy hledger-api bash curl \
 && mkdir /static \
 && hledger-api --swagger >> /static/docs.yml \
 && for f in index.html \
		swagger-ui.css swagger-ui.css \
		favicon-32x32.png favicon-16x16.png \
		swagger-ui-bundle.js swagger-ui-standalone-preset.js; do \
			curl -L https://unpkg.com/swagger-ui-dist@3/${f} >> /static/${f}; \
	done \
 && sed -i 's/url: ".*",/url: "\/static\/docs.yml",/' /static/index.html

COPY data /data
VOLUME /data

EXPOSE 8001

COPY start.sh /start.sh

CMD ["/start.sh"]
