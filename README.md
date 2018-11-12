# DS-standards

DS-standards is one of the first web applications I made after discovering a need for increased efficiency within my company. It's a single page instantaneous web application that demonstrates the power of Javascript. It's designed to easily see a cross reference for electrical distribution standards for different companies. 

In addtion to the usage of Ruby on Rails, this app also demonstrates the usage of:
- HTML/CSS
- Bootstrap
- AWS S3 Buckets

Visit [DS-standards](https://ds-standards-kyle-noll.herokuapp.com/) on Heroku.


## Getting Started

Clone the app and install the gem files
```
$ git clone git@github.com:knoll3/DS-standards.git
$ cd DS-standards/
$ bundle install
```
After this you should be good to go!

## Deployment
To deploy this app into development 
```
$ heroku create choose-app-name
$ git push heroku master
```
View app info
```
$ heroku apps:info
```
Open the app
```
$ heroku open
```

## Versions

DS-standards uses 
- Ruby 2.3.4
- Rails 5.1.4
