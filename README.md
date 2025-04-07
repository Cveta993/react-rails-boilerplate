# Last update

This project was last updated on _09-11-2023_.

The main important bit is that the React project has `proxy` set to `localhost:3001` in the `package.json` file. Take a look!

## Using the boilerplate

First, fork this boilerplate so you get your own copy of it. Once you have done that, you can clone your new repo to your machine, and get started.

You need **TWO** terminals for this.

In one terminal, run `bundle` to install the dependencies.
Update your config/database.yml if you use different credentials, update these values accordingly.
Run `bin/rake db:setup` to create the databases (called rails_project_development by default).
Create a .env file in the root folder and add API Authentication Cliend ID/Secret (where your Gemfile is located). Run `bin/rails s` to run the server.

In the other terminal, `cd` into `client`. Run `npm install`. Rename the `.env.example` file to be called `.env`. Then run `npm start` and go to `localhost:3000` in your browser.

In the browser, you can click on the button and see the data get loaded.

If this doesn't work, please message me!