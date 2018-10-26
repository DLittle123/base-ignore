#Bash notes
if ! npm list --depth 1 --global create-react-app >/dev/null 2>&1; then
  echo 'installing express generator globally'
  npm install create-react-app -g
fi

create-react-app client


cd client
curl https://raw.githubusercontent.com/DLittle123/base-templates/master/react_ignore >> .gitignore

sed -i '' -e '15a \
\  "proxy": "http://localhost:3001",
' package.json

mkdir css
mkdir components
mkdir scss

npm install axios --save
npm install prop-types --save
