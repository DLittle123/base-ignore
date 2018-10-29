import os
from flask import Flask
from dotenv import load_dotenv

server = Flask(__name__)

os.environ['APP_ROOT'] = os.path.join(os.path.dirname(__file__))
os.environ['ENV'] = os.environ.get('ENV','development')
if os.environ['ENV'] == 'local':
  dotenv_path = os.path.join(os.environ['APP_ROOT'], 'config/.env')
  load_dotenv(dotenv_path)

from server import routes