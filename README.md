# PuppyAPI

* In order to use this API, Rails 5 will need to be installed, HTTPie was used to interact with the API.

* To install rails follow this [link](https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm)
* To install HTTPie, follow their guide [here] (https://httpie.org/doc)
* To run the API you will need a local copy saved on your computer
* You will need to run migrations for the applicaion
* Navigate to the application in the terminal and run the following:
```~/puppy-api: rails db:create db:migrate```
* Run Bundle Install for the Gems
```bundle install```
*then start the rails server:
```~ /puppy-api: Rails s```

*Open a new Terminal and now you can run commands with HTTPie to interact with the API. 

##Creating an Account and Authorization Token
*you will need to provide a :name, :email, and :password
*run with your information:

```http :3000/signup name=<name> email=<email> password=<password> password_confirmation=<password>```

*This will provide you will an authentication token, you will need this for any requests to the API

##Creating or Liking Posts
*Now that we are signed up we can create a post or like another post

###Creating Posts
```
http POST :3000/Users/<Your USER ID>/Posts text="My Puppy is cuter than yours!" photo="king_george.png" \
->Authorization:"Your Auth Token"
```

###Liking Posts, you will need the post_id and the user_id of the post creator
```
http POST :3000/Users/<Your USER ID>/Posts/<POST ID>/Likes \
->Authorization:"Your Auth Token"

```

###Fetching User Profiles and Posts

*Fetch User Profile details
```
http :3000/users/<user id>
```
*Fetch User Posts and likes
``` 
http :3000/users/<user id>/posts
```

*You may also delete post and likes by using 
``` 
http DELETE :3000/path
```
* I do realize the limitations on which the path of the create "Posts" and "Likes" are accessed.  Ideally, would like to elimate the need add your own user_id to create a post, as well as another user's id to create a like. 
*Regardless of the ineffecient way Post and Likes are accessed, I am proud that as long as the information needed to access these are provided, the API functions correctly. 
