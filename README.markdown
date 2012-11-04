Rails Stars
===========

Rails Stars gives you ajax-y ratings shiny as stars.


How to give your models shiny stars ?
-------------------------------------

First add the gem to your Gemfile :

    # Gemfile
    gem 'rails_stars'

Mount the engine :

    # config/route.rb
    mount RailsStars::Engine => '/stars', as: :rails_stars

Run the generator to create the migration that creates the Star model :

    $ rails g rails_stars:star

And migrate :

    $ rake db:migrate

Second, add RailsStars dependencies to your application.js :

    //= require jquery
    //= require rails_stars

And to your application.css :

    *= require rails_stars

Tell your model(s) that they receives stars :

    class YourRateableModel < ActiveRecord::Base
      receives_stars
    end

Display the stars widget to allow your visitors to vote for a rateable :

    <%= stars_form_for @your_rateable_instance %>

Display current rating average for a rateable :
    <%= stars_for @your_rateable_instance %>


How to give stars on a per-user basis ?
--------------------------------------

First explain to your user model it can give stars :

    class YourUserModel < ActiveRecord::Base
      gives_stars
    end

Then make your ApplicationController aware of current star giver :

    class ApplicationController < ActionController::Base
      # ...
      def current_star_giver
        # assuming current_user returns current user for the session
        current_user
      end
      # ...
    end


Boring Licence Stuff
--------------------

Rails Stars is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see the LICENCE file or
[the official gpl page](http://www.gnu.org/licenses/)
