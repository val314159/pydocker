web: python app.py
consul: consul agent -client=0.0.0.0 -server -bootstrap-expect 1 -data-dir /tmp/consul -ui-dir /opt/consul_ui
nginx: nginx -g "daemon off;"
gunicorn: gunicorn app:app -k gevent -port -b 0.0.0.0:8800 --log-file -
