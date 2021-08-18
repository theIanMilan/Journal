## Live Demo
View the live app [at heroku.](https://our-journal.herokuapp.com/)

## Introduction

Our Journal is a project made by [Ian Mandap](https://github.com/theIanMilan) and [Janson Siy](https://github.com/JansonSiy) that allows users to sign up and create categories to keep track of tasks that they want to accomplish. It displays the user's task completion progress per category level. 

The goal in building this app was to learn about Test Driven Development (TDD) and one-to-many association between models.

## Screenshots

<p float = 'left'>
    <img src="app/assets/images/demo/journal-home.png" alt="Journal Homepage" width="500" height="300">
    <img src="app/assets/images/demo/journal-category.png" alt="Journal Categories" width="500" height="300">
    <img src="app/assets/images/demo/journal-task.png"  alt="Journal Tasks" width="500" height="300">
</p>

## App Architecture/ ERD:
<img src="app/assets/images/demo/Journal ERD.jpg" alt="Entity Relationship Diagram" width="500" height="300">

## Technologies

* Ruby v2.7.3
* Ruby on Rails v6.1.4
* CSS and SCSS
* Bootstrap5
* PostgresQL
* `Devise` gem for authentication
* [flatpickr](https://github.com/flatpickr/flatpickr) for datetime picker
* [Trix](https://github.com/basecamp/trix) for rich-text enabled form fields
* `toastr` gem for notifications

## To-Dos
* Display total tasks and task progress on the categories page
* Display urgent/past due tasks on the categories page
* Refactoring of style designs
* Designs for devise views (e.g. Edit Registration)