#Bash notes
#Todo Check for / Run npm install express-generator -g
express server

mkdir server/config
mkdir server/models
mkdir server/controllers
mkdir server/docs

find . -type f -not -path "*git/*" -not -name "*.sh" -exec sed -i '' s/var/const/ {} \;

echo '{\n  "asset": {\n    "url": "default"\n  }\n}' >> server/config/default.json
touch server/config/local.json
echo '{\n  "env": "NODE_ENV",\n  "port": "PORT"\n}' >> server/config/custom-environment-variables.json
echo 'PORT=3001' >> server/config/.env
echo '*\n!.gitignore' >> server/docs/.gitignore

curl https://raw.githubusercontent.com/DLittle123/base-templates/master/node_ignore >> .gitignore

sed -i '' -e "1i \\
require('dotenv').config({ path: './config/.env' });
" server/app.js

sed -i '' -e "42i \\
if (app.get('env') === 'local') {\\
\  const filepath = path.join(__dirname, './docs/routes.generated.txt');\\
\  require('express-print-routes')(app, filepath);\\
}\\
" server/app.js

sed -i '' /usersRouter/d server/app.js

sed -i '' -e "8a \\
router.use('/users', require('./users'));\\
" server/routes/index.js

sed -i '' -e '6i \
\    "local:server": "NODE_ENV=${NODE_ENV:=local} PORT=${PORT:=3001} nodemon bin/www",
' server/package.json

cd server

npm install
npm install nodemon --save-dev
npm install express-print-routes --save-dev
npm install config --save
npm install body-parser --save
npm install cors --save
npm install dotenv --save