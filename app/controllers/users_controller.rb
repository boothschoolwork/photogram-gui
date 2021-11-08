class UsersController <ApplicationController
def index
  
  matching_users = User.all

  @list_of_users = matching_users.order({ :username => :asc})
  render({:template => "user_templates/index.html.erb"})
end



def show
  
 # Parameters: {"path_username"=>"anisa"}
  url_username = params.fetch("path_username")

  matching_usernames = User.where({:username => url_username})

  @the_user = matching_usernames.at(0)

  if @the_user == nil
    redirect_to("/404")
  else

  render({:template => "user_templates/show.html.erb"})
  end

end


  def creating

    #   Parameters: {"input_username"=>"11"}
  input_username = params.fetch("input_username")  

  a_new_user = User.new

  a_new_user.username =input_username 

  a_new_user.save
   redirect_to("/users/"+ a_new_user.username)
      # render({:template => "user_templates/create.html.erb"})

   end
    





   def update


    #Parameters: {"input_username"=>"1111", "modify_username"=>"1111"}
    the_username = params.fetch("modify_username")

    cur_username = params.fetch("input_username")
    matching_user = User.where({:username => the_username})
    the_user = matching_user.at(0)   

    the_user.username = cur_username
    the_user.save
    
   #render({:template => "user_templates/update.html.erb"})
   redirect_to("/users/"+ the_user.username)
 
   end

end