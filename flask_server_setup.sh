#Bash notes
#checks for python 3, (ALTHOUGH SHOULD CHECK FOR >3.4)
if ! python3 --version >/dev/null 2>&1; then
  if ! virtualenv --version >/dev/null 2>&1; then
    echo 'Please install virtualenv'
  else
    virtualenv venv
  fi
else
  python3 -m venv venv
fi

source venv/bin/activate

pip install flask
pip install python-dotenv

pip freeze > requirements.txt

curl https://raw.githubusercontent.com/DLittle123/base-templates/master/flask_ignore  >> .gitignore

echo "# Requirements \
Python3.6.3 \
\
pip install -r requirements.txt\
FLASK APP=$APP.py FLASK_ENV=development ENV=local flask run" >> README.md

mkdir server

echo "Name of application : $APP"
echo 'from server import server' >> $APP.py
cd server
mkdir config
mkdir models
mkdir controllers
echo 'TEST=foo' >> config/.env
touch config/__init__.py
touch models/__init__.py
touch controllers/__init__.py
echo '[Example]\nA: 2\nB: False' >> local.py
echo '[Example]\nB: True\nC: Code' >> default.py

curl https://raw.githubusercontent.com/DLittle123/base-templates/master/flask_files/base_init.py  >> __init__.py
curl https://raw.githubusercontent.com/DLittle123/base-templates/master/flask_files/base_routes.py  >> routes.py

cd ..
FLASK_APP=$APP.py FLASK_ENV=development ENV=local flask run