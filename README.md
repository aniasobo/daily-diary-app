# Daily Diary 

Daily Diary is an application to store daily diary entries, using Sinatra and PostgreSQL.

## Instructions:

1. Clone/download this project
2. Run 'bundle install'
3. Connect to Postgres by running 'psql' in your terminal
4. Create a database called 'diary' and a test database called 'diary_test'
5. Execute the queries in db/migrations in the correct order (for each database)
6. To test the build, run 'rspec' in project directory
7. To run in browser, run 'rackup' in terminal in the project directory, then go to 'localhost:9292' in your browser


## Functionality:

- [x] Add diary entry
- [x] Save entry with a title 
- [x] view list of entries by title
- [x] click on title to view full entry
- [ ] edit saved entry
- [ ] delete entry
- [ ] add comment to entry
- [ ] display comments when entry is viewed
- [ ] add tag to entry
- [ ] filter entries by tag
 

### To dos:

- [x] I'll create a working implementation of the system described above (empirical)
- [x] I'll be able to diagram the flow of information through my application, from user interactions through to the database (empirical)
- [ ] I'll share my diagram with a coach in order to receive feedback (credible)
- [ ] refactor db connection to be its own class, in order to take the if statements out of the Entry class
- [ ] add automatically added timestamp using the appropriate PostGres data type that gets returned and displayed on the list
- [ ] add editable entries
- [ ] make entries deletable
- [ ] add comments to entries
- [ ] add tags for filtering entries
 

### Processes used:

- TDD, BDD
- modelling
- self-directed learning
- diagraming
- coding!
- problem solving/debugging


### Approach:

- as first step, I set up the project with rspec, capybara and sinatra, following the ruby project setup checklist
- I added the user stories I'm planning to cover to feature test spec files
- starting with a single database to make sure functionality is QA'ed before adding a test database
- I write feature test first because BDD; starting with adding entries to diary app
- to make the feature test pass, I add the view with the form to '/'
- added an initialise method to Entry class that is called as the return statement of the class methods, so that instances of Entry can be passed on to objects when those methods are called
- added Rack::MethodOverride in order to use RESTful routes
- I added a success view to give the user feedback about a successfully saved diary entry
- next step: adding a list of clickable titles. I add a feature test for this
- refactored my app to have a list of options in index; the add entry form, previously in the index view, is moved to its own view: new
- added a single entry by id view - not editable for now