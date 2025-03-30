![](https://i.imgur.com/rtGNUYG.png)

# Vincula
[![Total Commits](https://img.shields.io/github/commit-activity/t/PreservedAwe/Vincula?style=flat-square)](https://github.com/PreservedAwe/Vincula/graphs/commit-activity)

This is a web application that aims at being the middle man that `connects` other musicians who are into the same genres and/or artists based on geolocation.

## App Preview

Click this image to view a preview of this software on `youtube` or view the live app found here at [my website](https://vincula.preserved.app/)

[![](http://img.youtube.com/vi/aNC2XUBgACM/0.jpg)](https://www.youtube.com/watch?v=aNC2XUBgACM)

## Features

![](https://i.imgur.com/ITtT7pL.gif)

- Message Users
- Find and Connect with Users
- Sign In and Registration
- Toggle Buttons to `disable` or `enable` search filters for users

## Installation

### Option 1:(Docker)

```bash
$ git clone https://github.com/PreservedAwe/Vincula.git
```

- Download docker and docker compose for your system.

- Run `docker compose build` to build the container for the app.

- Run `docker compose up` to mount the container and have the app running live on localhost

### Option 2:(Ruby on Host Machine)

```bash
$ git clone https://github.com/PreservedAwe/Vincula.git
```
- Clone git repo onto your system.

- Download ruby on your system. Here is a link on how to do so from Ruby's official [website](https://www.ruby-lang.org/en/documentation/installation/).

- Cd into project folder then open the terminal.

- Run the command `bundle install` to install all neccessary dependencies.

- Run the command `rails db:create` then run `rails db:migrate` to create the neccessary database along with its tables.

- Run the command `rails db:seed` to to populate the database with test data.

- Run the command `rails server` to start the localhost server.

## Thank You

Thank you for taking a look at my project!