kinoglede
=========

«Finn en kinopartner til filmen *du* vil se.»

## Local development
Install dependencies

    npm install

Create an `env.json` file, and update the attributes

    {
      "port": 3000,
      "compressed": false,
      "facebook": {
        "clientID":     "foo",
        "clientSecret": "bar"
      }
    }

Start the MongoDB server

    sudo service mongod start

Start the Node.js server

    npm start
