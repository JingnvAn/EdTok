# README

### General
* Deployed via Heroku: [edtok_on_heroku](https://dry-ocean-78358.herokuapp.com/)

* Project milestones via Trello: [milestones_on_trello](https://trello.com/b/0afQZQIB/kanban)

* Developers: [Jingnu An](https://www.linkedin.com/in/jingnuan/), Jenna Blank, Wei Liu, Guobin Chen

* Ruby version: 2.7.2, Rails version: 6.1.3

* Database: postgresql




### Product Objectives

The EdTok aims to spread more knowledge in the form of short videos, helping users to utilize their leisure time to gain some interesting things through enjoyable ways.  Users can follow any other users on the platform, find who has followed them and who they are following. Users share their work or expertise by uploading videos to the app and others can find it, respond (similar to a like button) to it if they like it, or make a comment on it. 




### Prototype 

Can be found at "EdTok prototype.pdf"




### Interesting technologies

__Video relative gem__	
* carrier-wave
	Deal with the video upload and play function

* ffmpeg
	A collection of libraries and tools to process multimedia content such as audio, video, subtitles and related metadata.

* ffmpegthumbnailer
	A lightweight video thumbnailer that can be used by file managers to create thumbnails for your video files. The thumbnailer uses ffmpeg to decode frames from the video files, so supported videoformats depend on the configuration flags of ffmpeg.

__Storage relative gem__
* figro
	Tool to management sensitive configuration. It strives to be secure by default by encouraging a convention that keeps configuration out of Git.

* fog-aws
	Library to support Amazon clould service, in this case is the S3 bucket in Amazon cloud.




### Completed(core view)

* __Home Page__

  Homepage is to present some basic ideas and some application methods. 

  Database relative: None

* __Sign in/Sign up Page__
	Sign in/Sign up page is to let user sign in/ sign up into the app. When users try to sign in, they need to provide their username, email address, password and password confirmation. When users try to login in, they just need to provide email address and password.  
	
	Database relative: User

* __User Profile Page__
	After successfully loggin in, users will come to profile page where they could see how many people she/he follows and how many people follow her/him. In this page, users could see videos they uploaded and they could also click upload button to upload their videos. 

	Database relative: User, Following, Upload

* __Video play page__

	The video profile page will be displayed by click the explore video card. In this page, users could makes there comments and see other users’ comments and show their own preference to this video. This page also provide simple information of the provider of video and link to her/his page.

Database relative: Video, User, Popular, Comments, Follower, Following




### Completed(core view)

* __Explore Homepage__

	When users firstly enter this page, the page would automatically display all the videos in the database with video name and created time and show button to enter video profile page which will show more detailed information of this video. The explore page has another capability that to search one video by video name, if there is no such video it would display flash note. The page could also display videos by three subjects (science, comic, others).

	Database relative: Video, User, Popular, Subject




### Key model

* __Following__
 Allow users to follow other

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
Columns: integer id, string name, integer user_id

Name: Subject
Columns: integer id, string name, integer grade_level

Name: Comment
Columns: integer id, integer author, string text 

Name: Like
Columns: integer id, integer liked_by


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



### URL

Home page: /
	User urls: /users, users/new, /users/:id, /user/:id/edit
Static page: 	Behind the scene:  /behind_the_scene
		About:/about
Logout:  /logout
