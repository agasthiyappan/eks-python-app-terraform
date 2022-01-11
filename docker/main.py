import time
import os
import redis
from os import environ 
from flask import *

app = Flask(__name__)
cache = redis.Redis(host='rediscluster.vvetkk.0001.use1.cache.amazonaws.com', port=6379)

Redis_Host = environ.get('redisdb')
App_Name = environ.get('app')
host_name = os.environ['HOSTNAME']

def get_hit_count():
    retries = 5
    while True:
        try:
            return cache.incr('hits')
        except redis.exceptions.ConnectionError as exc:
            if retries == 0:
                raise exc
            retries -= 1
            time.sleep(0.5)

@app.route('/public/<name>')
def public(name):
  if name == 'live':
    return 'live'
@app.route('/hitme')
def hitme():
    count = get_hit_count()
    return 'Hello! You are {}th visiter.\n'.format(count)
@app.route('/')
def hello():
    count = get_hit_count()
    return 'Hello! You are {}th visiter.\n'.format(count)
@app.route('/env')
def env():
    host_name = os.environ['HOSTNAME']
    App_Name = environ.get('app')
    Redis_Host = environ.get('redisdb')
    env_pri = os.getenv("redisdb","#general")
    return f'Redis db host is {host_name} ..{env_pri}.. {Redis_Host}.\nApp name is {App_Name }.\n {os.environ}'

