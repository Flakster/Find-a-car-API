# Find a car RESTful API

This is a backend-only project. Consists in an API REST for a car sale service. It allows the client app to offer the following workflow to the end user:

1. The user logs in the app, by typing his credentials: email and password. If the credentials are valid A token authorization is returned.
2. The user is presented with a list of cars.
3. When a user selects a car, detailed information about that car is presented and the possibility add it to favorites
4. The user can access a list of favorite cars

## Entity relationship diagram

![Screenshot from 2020-09-06 10-14-29](https://user-images.githubusercontent.com/53324035/92329320-585df000-f02c-11ea-9545-71c5c06667d8.png)

## Built with

  * Ruby on Rails
  * Postgresql
  * Rspec
  * Shoulda matchers
  * Factory bot
  * Database cleaner
  * Faker
  * Bcrypt
  * JSON web token
  
## Prerequisites

  * Ruby: 2.7.0
  * Rails: 5.2.4
  * Postgres: >=9.5
  * API client like Postman or HTTPie

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
  CREATE ROLE my_api WITH CREATEDB LOGIN PASSWORD 'pass123';
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
11. Open your API client and go to **localhost:3000**

12. Read the documentation to know the way to make the requests properly

13. To run the automated unit tests use the following command:
```
   bundle exec rspec
```

## Read the public documentation [here](https://documenter.getpostman.com/view/12581937/TVCh1TdA)

## The API public address

`https://find-a-car-api.herokuapp.com`


## Watch a video with the presentation of the project [Here](https://www.loom.com/share/e57c25a2a09748dfbab0c25fee859348)


## Acknowledgments:

 * [Microverse](http://microverse.org)
 
## Show your support
Give a ⭐️ if you like this project!
 
## License
This project is [MIT](https://github.com/Flakster/Find-a-car-API/blob/api/LICENSE) Licensed

## Author
👤 Carlos Santamaría

* Twitter: [@Flakster ](https://twitter.com/Flakster )
* Github: [@Flakster](https://github.com/Flakster)
