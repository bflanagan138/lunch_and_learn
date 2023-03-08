<h1 align="center">
  <img src="https://www.personifyleadership.com/wp-content/uploads/2017/05/Lunch-and-Learn.png">
</h1>

## Table of Contents

- [Project Overview](#project-overview)
- [Tech Stack](#tech-stack)
- [Database](#database)
- [Setup and Installation](#setup-and-installation)
- [Learning Goals](#learning-goals)
- [API Information](#api-information) 
- [Project Owner](#project-owner)

## Project Overview

**_Lunch and Learn_** is the final project for Back End Turing Mod 3 students. Students were tasked with creating an API based application to expose API endpoints satisfying requirements outlined by our front end team.

## Tech Stack
The following technologies were utilized in completion of this project.<br><br>
<img src="https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white"><br>
<img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white"><br>
<img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"><br>
<img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white">

Gems: 
- [Faraday](https://github.com/lostisland/faraday)
- [Figaro](https://github.com/laserlemon/figaro)
- [JsonAPI-Serializer](https://github.com/jsonapi-serializer/jsonapi-serializer)
- [SecureRandom](https://github.com/ruby/securerandom)
- [WebMock](https://github.com/bblimke/webmock)
- [Shoulda-Matchers](https://github.com/thoughtbot/shoulda-matchers)
- [SimpleCov](https://github.com/simplecov-ruby/simplecov)
 
## Database
Our schema employs a one to many relationship between Users and Favorites
<p align="center">
  <img width="800" src="https://github.com/bflanagan138/image_repo/blob/77306a5bebcfc6f9701a07724696eb2f1c38fd26/lunch_and_learn_schema.png">
</p>

## Setup and Installation

From your terminal, run:

```git clone git@github.com:bflanagan138/lunch_and_learn.git```

```bundle install```

```rails db:{drop,create,migrage}```

To run the tests: ```bundle exec rspec```

To run the server on localhost:3000: ```rails s```

## Learning Goals

- Consume and expose multiple API endpoints
- Build and configure API endpoints for our front end team using data consumed from APIs
- Stubbing API data

## API Information
Multiple API Endpoints were consumed to gather data for this project. Under each are the naming conventions used in the code for any secret keys. For any listed secret keys, you will need to obtain your own personal keys and assign them exactly as shown in your [application.yml file](https://github.com/laserlemon/figaro). 

[Postman API Documentation](https://documenter.getpostman.com/view/25516850/2s93JqT5VV)

1. [Edamam API](https://developer.edamam.com/edamam-docs-recipe-api)
  - edamam_type: public *enter exactly as shown*
  - edamam_app_id: < your id here >
  - edamam_app_key: < your key here >
2. [Google / YouTube API](https://developers.google.com/youtube/v3)
  - youtube_channel_id: UCluQ5yInbeAkkeCndNnUhpw *enter exactly as shown*
  - google_api_key: < your key here >
3. [UnSplash API](https://unsplash.com/developers)
  - unsplash_client_id: < your id here >
  - unsplash_secret_key: < your key here >
4. [RestCountries API](https://restcountries.com/#api-endpoints-v3)

## Project Owner

| [<img alt="Bryan" width="75" src="https://media.licdn.com/dms/image/D5635AQHLsl9SWgJRJQ/profile-framedphoto-shrink_200_200/0/1677792669714?e=1678399200&v=beta&t=dcfkwSGIfADNuxlbqQVNkTGuKyMV-fNhPEKiBc3AEy0"/>](https://www.linkedin.com/in/bryanflanagan138/) | 
|----------- |
| Bryan Flanagan |
| [GitHub](https://github.com/bflanagan138) |
| [LinkedIn](https://www.linkedin.com/in/bryanflanagan138/) |
