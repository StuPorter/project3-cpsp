class HomeController < ApplicationController
  get '/:id/?' do |id|
    "Your ID was #{id}"
  end

  get '/?' do
    @something = 'Yo mutha wuz a wunderful woman'
    a_local_variable = '1 million dollars'

    erb :home, locals: { my_var: 'not whatever', my_local: a_local_variable }
  end
end
