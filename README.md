# B2 Assessments

Base repository for B2 assessments and diagnostics.

This repository requires and has been tested on Ruby v2.5.3 and is based on Rails 5.2.4.3.

RSpec and Shoulda-Matchers have been installed and set up.

## Setup

1. fork this repo
2. clone your fork
3. `git clone <paste_repo>`
4. `cd b2-mid-mod`
5. `bundle install`

When you run `bundle exec rspec` you should have 0 tests.

## Instructions

* Work on this assessment independently. DO NOT discuss with anyone.
* You are allowed to use any references including notes, Google, lesson plans, etc.
* Read each story carefully before you start working.
* Commit Frequently, about every 15 - 30 minutes
* Push your code to your fork once the time is up (not before!)

## Submission

Once the time for the assessment is up, push your code to your fork and create a pull request to the `turingschool-examples` repository. Include the following:

* Your Name
* A reflection on how you felt you did with this challenge and what story you got through

## Requirements

* TDD all new work
* model methods and relationships must be fully tested.

## Not Required

* No visual styling is required or expected
* You do not need to test for or create any model validations.

## Overview
 
We are creating an application to track studios, movies, and actors
 
* Studios have a name and location
    * ex. name: 'Universal Studios', location: 'Hollywood'
* Movies have a title, creation year, and genre
    * ex. title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure'
* Actors have a name, age, and currently_working (boolean) attributes
    * name: 'Harrison Ford', age: 78, currently_working: false
* Studios have many Movies
* Movies belong to a Studio
* Movies have many Actors
* Actors can be in many Movies
 
Some of the initial migrations and model set up has been done for you. After you set up your database, you should be able to run the tests and see two passing tests.
 
## User Stories
 
```
Story 1
Studio Show
 
As a user,
When I visit a studio show page
I see the studio's name and location
And I see the titles of all of its movies
```

```
Story 2
Studio's Actors

As a user,
When I visit a studio show page
I see a list of actors that have acted in any of the studio's movies
And I see that the list of actors is unique (no duplicate actors)
And I see that the list of actors is ordered from oldest actor to youngest
And I see that the list of actors only includes actors that are currently working
```
 
```
Story 3
Movie Show
 
As a user,
When I visit a movie's show page.
I see the movie's title, creation year, and genre,
and I see all of the actors in the movie
```
 
```
Story 4
Add an Actor to a Movie
 
As a user,
When I visit a movie show page,
I do not see any actors listed that are not part of the movie
And I see a form to add an actor to this movie
When I fill in the form with the name of an actor that exists in the database
And I click submit
Then I am redirected back to that movie's show page
And I see the actor's name is now listed

(You do not have to test for any sad path, for example if the name submitted does not match an existing actor)
```
 
## Extension
 
```
Extension
Coactors
 
As a user,
When I visit an actor's show page
I see that actors name and age 
And I see a unique list of all of the actors this particular actor has worked with.
```
 
 
 
 

