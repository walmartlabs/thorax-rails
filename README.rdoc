#thorax-rails

The thorax gem includes Thorax.js and its dependencies (backbone, underscore, and handlebars) in your Rails asset pipeline.  A few handy generators take care the boilerplate code so you don't have to.  Enjoy!

## Rails setup
This gem requires the use of rails 3.1 and greater, coffeescript and the new rails asset pipeline provided by sprockets.

### Installation

In your Gemfile, add this line:

    gem "thorax-rails", "~> 0.1.0"

Then run the following commands:

    bundle install
    rails g thorax:install


Running `rails g thorax:install` will create the following directory structure under `app/assets/javascripts/`:

    models/
    collections/
    routers/
    templates/
    views/

It will also create view, model, collection, and router files that your app will extend.  These are great places to define app-wide behaviors.

## Generators
thorax-rails currently provides 3 simple generators to help get you started using Thorax.js with rails 3.1 and greater.
The generators will only create client side code (javascript).

### Model Generator

    rails g thorax:model ModelName field:type field:type

This generator creates thorax models and collections in `app/assets/javascript/models` and `app/assets/javascripts/collections` respectively.

### Routers

    rails g thorax:router ModelName action action

This generator creates a thorax router with corresponding views and templates for the given actions provided.

### Views

    rails g thorax:view ModelName viewName viewName

This generator creates views and their associated templates

### Scaffolds

Coming soon!  I am currently developing a full CRUD scaffold which will create views and wire up a router for all the RESTful actions for a given model. Watch for version 2!


##Contributing to thorax-rails

This gem is still in development.  I would love to hear about any bugs you run into, or tips on how it could be improved. If you would like to contribute directly, please fork the project and start a new branch with a helpful name.  Please write tests for your changes.

##Acknowledgments

This gem was written with help from the authors of [Thorax](https://github.com/walmartlabs/thorax), and was heavily influenced by the wonderful [backbone-rails gem](https://github.com/codebrew/backbone-rails)

##Copyright

Copyright (c) 2013 WalmartLabs. See MIT-LICENSE for
further details.

