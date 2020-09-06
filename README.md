# Find a car RESTful API

This is a backend-only project. Consists in an API REST for a car sale service. It allows a user to log in and then it presents a list of cars. The user can choose one car to see its details and have the chance to add that car to its own list of favorites. The user can also show his/her favorites.

## Screenshots

## Built with

  * Ruby on Rails
  * Postgresql
  
## Prerequisites

  * Ruby: 2.7.0
  * Rails: 5.2.4
  * Postgres: >=9.5

## Getting Started:

To get a local copy up and running follow these simple example steps:

1. Under the repository name, click the Clone or download green button.

2. Copy the URL given by clicking the clipboard button

3. Open a terminal window in your local machine and change the current directory to the one you
   want the clone directory to be made.

4. Type  git clone and the paste the URL you previusly copied to the clipboard

5. Change the current directory to the newly created folder

6. Install the ruby gems by running:

```
bundle install
```

7. Setup database by running this:

```
  sudo -u postgres psql
  CREATE ROLE events WITH CREATEDB LOGIN PASSWORD 'pass123';
```
  (Exit postgres console with \q)
  
8. Make sure you have your yarn packages up to date. If not:
```
  yarn install --check-files
```
9. Populate the database by running:
```
   rails db:create
   rails db:migrate
```
10. Start your web server:
```
   rails server
```
11. Open your web browser and go to **localhost:3000**

## The API public address

`https://find-a-car-api.herokuapp.com`

## Read the public documentation [here](https://documenter.getpostman.com/view/12581937/TVCh1TdA)

## Watch a video with the presentation of the project [Here]()


## Acknowledgments:

 * [Microverse](http://microverse.org)
 
## Show your support
Give a ⭐️ if you like this project!
 
## License
This project is [MIT]() Licensed

## Author
👤 Carlos Santamaría

* Twitter: [@Flakster ](https://twitter.com/Flakster )
* Github: [@Flakster](https://github.com/Flakster)
