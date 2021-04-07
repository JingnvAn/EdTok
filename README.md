# README

### General
* Deployed via Heroku: [edtok_on_heroku](https://dry-ocean-78358.herokuapp.com/)

* Project milestones via Trello: [milestones_on_trello](https://trello.com/b/0afQZQIB/kanban)

* Developers: [Jingnu An](https://www.linkedin.com/in/jingnuan/), Jenna Blank, Wei Liu, Guobin Chen

* Ruby version: 2.7.2, Rails version: 6.1.3

* Database: postgresql

### Product Objectives

The EdTok aims to spread more knowledge in the form of short videos, helping users to utilize their leisure time to gain some interesting things through enjoyable ways.  Users can follow any other users on the platform, find who has followed them and who they are following. Users share their work or expertise by uploading videos to the app and others can find it, respond (similar to a like button) to it if they like it, or make a comment on it. 



### In development(core view)

* __Home Page__

  Homepage is to present some basic ideas and some application methods. 

  Database relative: None

* __Sign in/Sign up Page__

	Sign in/Sign up page is to let user sign in/ sign up into the app

	Database relative: User

* __User Profile Page__

	User homepage displays what the user himself/herself has uploaded. Below this section, it displays who follows him/her and who the user follows. Also, there are some classifications of videos such as science, life and so on. When the user clicks the followers or following button, the user could see the videos uploaded by the follower and following user.

	Database relative: User, Following, Follower

* __Explore Homepage__

	Explore homepage display the entry of all the video. Each video has a small window including their title, cover and popular. User can click it to its play page. On the right side, we plan to have sidebar have a search bar and list all the catagories of video by which user can located specific video.

	Database relative: Video, User, Popular, Subject

* __Video play page__

User actually watch video here. Above the video play window, we have title, maker information. Below the video, we place two icon allow user to rate this video and follow the video maker. At the bottom of this page is the comments place.

Database relative: Video, User, Popular, Comments, Follower, Following




### Key model

* __Following__
 Allow users to follow other

* __Follower__
 Allow users see who are following her/him. 

* __Video__
Deal with the video upload and play function

* __Comments__
Create, save and show the comments made in video play page 

* __Users__
 Deal with the sign up and log in function, and also show the bio information in profile page;





### Database schema

Name: User
Columns: integer id, string name, string username, string email, string bio

Name: Video
Columns: integer id, string name

Name: Subject
Columns: integer id, string name, integer grade_level

Name: Comment
Columns: integer id, integer author, string text 

Name: Like
Columns: integer id, integer liked_by

Name: Follower
Columns: integer id, integer user_id, integer follower_id

Name: Following
Columns: integer id, integer user_id, integer following_id

* Association table - see this link for how the association works 
Name: Follow
Columns: integer id, integer user_id, integer following_id
Note: user_id refers to the id of the user that has made the request to follow someone
following_id refers to the user who the request has been made to

* Association table between User and Video -- one to many
Name: Upload
Columns: integer id, integer user_id, integer video_id

* Association table between Video and Subject -- many to many
Name: Tag
Columns: integer id, integer video_id, integer subject_id

* Association table between Video and Like -- one to many
Name: Reaction
Columns: integer id, integer video_id, integer like_id

*Association table between Video and Comment -- one to many
Name: Response
Columns: integer id, integer video_id, integer comment_id



### URL

Home page: /
	User urls: /users, users/new, /users/:id, /user/:id/edit
Static page: 	Behind the scene:  /behind_the_scene
		About:/about
Logout:  /logout



### Gem 
* carrier-wave
	Deal with the video upload and play function


