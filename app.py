#!/usr/bin/python
from __future__ import print_function

def app(env, start_response):
    if env['PATH_INFO'] == '/':
        start_response('200 OK', [('Content-Type', 'text/html')])
        return ["<b>hello world</b>"]
    else:
        start_response('404 Not Found', [('Content-Type', 'text/html')])
        return ['<h1>Not Found</h1>']
    pass

if __name__ == '__main__':
    from gevent.pywsgi import WSGIServer
    WSGIServer(('localhost', 8088), app).serve_forever()

