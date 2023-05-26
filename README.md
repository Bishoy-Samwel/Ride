# Ride It (Online shop)

## Table of Contents

- [Table of Contents](#table-of-contents)
- [About Project](#about-project)
- [Functionality Requirements](#functionality-requirements)
- [Built With](#built-with)
- [Getting Started](#getting-started)
- [Acknowledgements](#acknowledgements)
- [Show your support](#show-your-support)

## About Project

> Online bicycle store, with a Telegram bot.

## Functionality Requirements

- **Admin:** 
  - CRUD(Bikes), ☑️
  - login/logout(Admin portal), ☑️
  - Conditionally price generation while creartion. ☑️
- **User:** 
  - Browse bikes, ☑️
  - Search bikes by filter combination of name, style, price, ☑️
  - A telegram bot answers bike availability, ☑️

## Built With

- Ruby '3.2.0'
- Rails '7.0.4'

## Getting Started

- Clone this repo

  ```bash
  git clone https://github.com/Bishoy-Samwel/Ride
  ```

- Navigate to JoggingAPI directory

  ```bash
  cd Ride
  ```
- On the comandline, at the project's root, run `bundle i` to install app dependencies
  - `rails db:create`
  - `rails db:migrate`
  - `rails db:seed`
  - `./bin/dev`
  - To access admin panel `http://localhost:3000/admin/`
- To run the test cases:
  - `rspec`

- Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

## Creating the bot - Having the token
- The first step in creating our bot is to talk to the BotFather.
- Open Telegram app
- Type in the search form BotFather.
- Hit the start button which will display a list of commands that we can use to interact with the BotFather.
- Let’s create our bot using the command `/newbot`.
- Now we have to register for a username, note: it must end in bot.
- Command `/token` will give us an API token to access our bot through HTTPS. (We will use it later)
 
 This is the username of the bot @RideBikeBot
 
## Author

👤 **Bishoy Samwel Faheem**

- GitHub: [@Bishoy Samwel Faheem](https://github.com/Bishoy-Samwel)
- LinkedIn: [Bishoy Samwel](https://www.linkedin.com/in/bishoy-samwuel-ss/)


## Acknowledgements

- [Active Admin](https://github.com/activeadmin/activeadmin)
- [Has Scope](https://github.com/heartcombo/has_scope)
- [Telegram Bot Ruby](https://github.com/atipugin/telegram-bot-ruby)


