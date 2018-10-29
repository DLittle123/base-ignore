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

mkdir server
read app
echo "Name of application : $(app)"
echo 'from server import server' >> $app.py
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

 >> server/__init__.py