class UsersController < ApplicationController
  
   get '/update/:username/:new_username/?' do |username, new_username|
     user = User.find_by username: username
     
      if user
        user.username = new_username
        user.save
        "User #{username} was changed to #{user.username}"
      else
        "No user to update"
    end
  end

  get '/delete/:username' do |username|
    user = User.find_by username: username
      if user
        user.destroy
        "User #{username} was deleted"
      else
        "Can't destroy a thing that does not exist"
      end
    end 


  get '/:username/:password/?' do |username, password|
    if username != '' && password != ''
      user = User.create username: username, password: password
    end

    if user
      'User was created'
    else
      'There was an error creating a user'
    end
  end
  
  get '/:username/?' do |username|
    user = User.find_by username: username

    if user 
      "Your username was #{user.username}"
    else
      'No user by that name found'
    end
  end

end

get '/login/?' do
  erb :login
end

post '/login/?' do
 user User.find_by username: params['username']

 if user
    pasword = BCrypt::Password.new user.password

    if pasword == params['password']
      'You are logged in ' + user.username
    else
      'Password does not match'
    end
  else 
    'No user with that username'
  end
end



# get '/membersonly/?' do
#   if session
#   end
# end


# get '/?' do
#   erb :users
# end

# post '/?' do
#   password = BCrypt::Password.create.params['password']
#   user = User.create username: params['username'], email: params['email'], password: password
# end




