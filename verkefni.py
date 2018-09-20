from sys import argv
import json
import urllib.request, json
import bottle
from bottle import *

with urllib.request.urlopen("http://apis.is/currency/m5") as url:
    data = json.loads(url.read().decode())

with open("gogn.json", "r") as skra:
    gogn = json.load(skra)


@route('/')
def index():
       return """ 
        <a href="/a">Json local</a>
        <a href="/b">API</a>       
       """

@route('/a')
def index():
        return template("index.tpl", gogn)


@route('/b')
def about():
        return template("index2.tpl" )

@route('/static/<filename>')
def server_static(filename):
    return static_file(filename, root='./static')


#run(host='localhost', port=8800, debug = True, reloader=True)

bottle.run(host='0.0.0.0', port=argv[1]) #Þetta þarf að vera í gangi til að heruko serverinn mun virka
