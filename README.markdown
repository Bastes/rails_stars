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

Then you've got to tell the model that it has stars :
    class YourRateableModel < ActiveRecord::Base
      has_stars
    end

And explain to your user it can give stars :
    class YourUserModel < ActiveRecord::Base
      gives_stars
    end

Then you can start displaying and giving stars in your views :
    <%= stars_for @your_rateable_instance %>


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
