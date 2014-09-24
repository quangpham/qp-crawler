set -e

if [ -f /configured ]; then
  exec /usr/bin/supervisord
fi

date > /configured
exec /usr/bin/supervisord