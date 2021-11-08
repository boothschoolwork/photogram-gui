class PhotosController < ApplicationController
  def index

    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({:created_at => :desc })
    render({:template => "photo_templates/index.html.erb"})
  end



  def show
  # Parameters: {"path_id"=>"777"}
  url_id = params.fetch("path_id")

  matching_photos = Photo.where({:id => url_id})

  @the_photo = matching_photos.at(0) 

   

   
     render({:template => "photo_templates/show.html.erb"})

   end

   def bai

    the_id = params.fetch("toast_id")

    matching_photos = Photo.where({:id => the_id})
    the_photo = matching_photos.at(0)    
    the_photo.destroy 

    #render({:template => "photo_templates/bai.html.erb"})
    redirect_to("/photos")
   end



   def create

#   Parameters: {"input_image"=>"1", "input_caption"=>"1", "input_owner_id"=>"1"}
   input_image = params.fetch("input_image")
   input_caption = params.fetch("input_caption")
   input_owner_id = params.fetch("input_owner_id")

  a_new_photo = Photo.new

  a_new_photo.image = input_image  
  a_new_photo.caption = input_caption
  a_new_photo.owner_id = input_owner_id

  a_new_photo.save
   # render({:template => "photo_templates/create.html.erb"})

   redirect_to("/photos/"+ a_new_photo.id.to_s)
   end


   def update

    #  Parameters: {"input_image"=>"1", "input_caption"=>"1", "modify_id"=>"777"}

    the_id = params.fetch("modify_id")

    matching_photos = Photo.where({:id => the_id})
    the_photo = matching_photos.at(0)    

    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")

    the_photo.image = input_image
    the_photo.caption = input_caption
    the_photo.save

   # render({:template => "photo_templates/update.html.erb"})

   redirect_to("/photos/" + the_photo.id.to_s)
   end




   def crt
    #Parameters: {"input_photo_id"=>"785", "input_author_id"=>"1", "input_body"=>"1"}

    input_p_id = params.fetch("input_photo_id")
    input_a_id = params.fetch("input_author_id")
    input_new_com = params.fetch("input_body")
 
   a_new_comment = Comment.new
 
   a_new_comment.photo_id = input_p_id 
   a_new_comment.author_id = input_a_id
   a_new_comment.body = input_new_com
 
   a_new_comment.save

   redirect_to("/photos/" + a_new_comment.photo_id.to_s)
    #render({:template => "photo_templates/crt.html.erb"})
    
  
       end

end
