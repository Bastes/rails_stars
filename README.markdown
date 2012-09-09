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

Second, add RailsStars dependencies to your application.js :

    //= require jquery
    //= require rails_stars

And to your application.css :

    *= require rails_stars

Then you've got to tell the model (and its controller) that it receives stars :

    class YourRateableModel < ActiveRecord::Base
      receives_stars
    end

    class YourRateableModelController < ApplicationController::Base
      def stars
        @rateable = YourRateableModel.find(params[:id])

        @rateable.receive_stars rating: params[:rating]
        # or, assuming you want to know who rated what:
        # @rateable.receive_stars rating: params[:rating], giver: current_user
      end
    end

    # config/routes.rb
    resource :your_rateable_model do
      post :stars, :on => :member
    end

You can also explain explain to your user model it can give stars :

    class YourUserModel < ActiveRecord::Base
      gives_stars
    end

Then you can start displaying and giving stars in your views :

    <%= stars_for @your_rateable_instance %>

(or, if you want your user to have his own vote reflected)

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
