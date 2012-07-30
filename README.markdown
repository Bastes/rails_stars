Rails Stars
===========

Rails Stars gives you ajax-y ratings shiny as stars.


How to give your models shiny stars ?
-------------------------------------

First you need to run the generator to create the migration that
adds the Star model :

    $ rails g rails_stars:star

And migrate :

    $ rake db:migrate

Then you've got to tell the model that it receives stars :

    # app/models/your_rateable_model.rb
    class YourRateableModel < ActiveRecord::Base
      receives_stars
    end

Then you need to explain your receiver model it receives stars :

    # app/controllers/your_rateable_models_controller.rb
    class YourRateableModelsController < ApplicationController::Base
      grants_stars :to => YourRateableModel
    end

And configure a route to send the query :

    # config/routes.rb
    resource :your_rateable_model do
      post_stars
    end

Then you can start displaying and giving stars in your views :

    <%= stars_for @your_rateable_instance %>

How to keep track of who rates what ?
-------------------------------------

You can also explain explain to your user model it can give stars :

    # app/models/your_user_model.rb
    class YourUserModel < ActiveRecord::Base
      gives_stars
    end

In that case you've got to tell your controller it's personal :

    # app/controllers/your_rateable_models_controller.rb
    class YourRateableModelsController < ApplicationController::Base
      # supposing your_current_user returns current logged user
      controls_stars giver: :your_current_user
    end

And you can display the user his latest vote instead of the average :

    <%= stars_for @your_rateable_instance, current_user %>


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
