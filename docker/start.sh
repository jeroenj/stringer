#!/usr/bin/env sh
if [ -z "$DATABASE_URL" ]; then
  cat <<-EOF
	$(tput setaf 1)Error: no DATABASE_URL was specified.

	For a quick start use DATABASE_URL="sqlite3:':memory:'"
	(not recommended for production).
	EOF

  exit 1
fi

: ${FETCH_FEEDS_CRON:='*/10 * * * *'}

cat <<-EOF > /app/crontab
	$FETCH_FEEDS_CRON cd /app && bundle exec rake fetch_feeds
EOF

exec /usr/bin/supervisord -c /etc/supervisord.conf
