# ASSESSEMENT RAILS 5 REST API 

Assessemsent for REST API to perform CRUD functions. 


## INSTALL DEPENDENCIES
```bash
$ bundle install
```

## RUN MIGRATION
```bash
$ rails db:migrate
```

## RUN SERVER
```bash
$ rails s
```


Enjoy services:
#Find Product = http://localhost:3000/api/v1/questions/1001
#List Questions = http://localhost:3000/api/v1/questions


#heroku setting
heroku apps:create
heroku buildpacks:add heroku/nodejs --index 1
heroku buildpacks:add heroku/ruby --index 2
git push heroku master
heroku run rake db:migrate
heroku run rake db:seed
heroku open