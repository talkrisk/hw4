class PostsController < ApplicationController


  def create
    if @current_user
    @post = Post.new
    @post["title"] = params["place"]["title"]
    @post.uploaded_image.attach(params["post"]["uploaded_image"])
    @post["description"] = params["place"]["description"]
    @post["posted_on"] = params["place"]["posted_on"]
    @post["place_id"] = params["place"]["place_id"]
    @post.save
  else
    flash["notice"] = "Login first."
  end
    redirect_to "/places/#{@post["place_id"]}"
  end

end
