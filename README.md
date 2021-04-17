# Swag

Swag is a ruby project.The demo scripts in this repository allow you to run simple automated tests in order to validate your Ruby testing environment for [Saucelabs](https://www.saucedemo.com/).

## General Prerequisites

In order to complete these exercises you must complete the following prerequisite installation and configuration steps:

* Install [Git](https://github.com/rko619619/swag/blob/main/docs/prerequisites.md#install-git)
* Install [Ruby](https://github.com/rko619619/swag/blob/main/docs/prerequisites.md#install-ruby)
* Install an [IDE](https://github.com/rko619619/swag/blob/main/docs/prerequisites.md#install-an-ide)
* [Setup the Project](#setup-the-project)



### Setup the Project

1. Clone this Repo

    * Run the following command

        ```
        $ git clone swag https://github.com/rko619619/swag.git
        ```
2. Setup `Gemfile`:
    * Install `bundler` so that we can easily update and resolve dependencies:

        ```
        $ gem install bundler
        ```

3. Execute the `bundle` Command:
    * Use the following to install the required `gems`:

        ```
        $ bundle install --path .bundle
        ```
    
    * You may also use 'Run Configurations' in your IDE. For directions on how to setup Run/Debug Configurations refer to Documentation:
        * [Aptana Studio Documentation](https://github.com/aptana/studio3-ruby)
        * [RubyMine Documentation](https://www.jetbrains.com/ruby/documentation/)
        * [Komodo Edit Documentation](http://docs.komodoide.com/manual)
        * [NetBeans Documentation](https://netbeans.org/kb/)
   ### Running Tests
* Run all specs in project:
    ```
  $ bundle rspec spec
  ```
* Run tests in parallel on default configuration:
  ```
  $ bundle exec rake parallel
  ```
* Run one test(for example)
  ```
  $ bundle rspec spec/features/sign_in_spec.rb
  ```
