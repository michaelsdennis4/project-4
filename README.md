# project-4
WDI - Project 4 - Final Project

MariaNiforos.com

https://maria-niforos-antiques.herokuapp.com/

A web application for displaying and selling antique laces, linens, clothing, and textiles.

The application has public areas for searching and viewing items for sale, including the display of high-resolution images.

It will also have a secure private administrator login and areas for maintaining the site, including the creation, editing, and deleting of items for sale, uploading images, as well as maintaining categories and keywords to facilitate searching.

Trello board, including wireframes, ERD, etc. - https://trello.com/b/SxwHMsbs/michael-dennis-project-4

This project uses the following technologies:
- **Ruby on Rails**
- **Postgresql**
- **Bcrpyt** https://en.wikipedia.org/wiki/Bcrypt - for secure, encrypted passwords
- **Dragonfly** https://github.com/markevans/dragonfly - to manage upload, storage, and retrieval of images on Amazon S3 bucket 
- **Image Magick** http://www.imagemagick.org/script/index.php - manages the resizing of images on-the-fly for rendering purposes
- **Amazon S3 API** http://aws.amazon.com/s3/ - for storage of high-resolution images
- **jQuery** - for front-end functionality, including ajax calls
- **Mustache.js** http://mustache.github.io/ - for front-end templating
- **Bootstrap** - http://getbootstrap.com/ - for image carousel
