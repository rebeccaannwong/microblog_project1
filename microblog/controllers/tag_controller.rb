# ===============
#    tags
# ===============

# INDEX
get '/tags' do
  @tags = Tag.all
  erb :'tags/index'
end

# SHOW
get '/tags/:id' do
  @posts = Post.all
  @tag = Tag.find(params[:id])
  erb :'tags/show'
end

# ADD post TO tag
put '/tags/:id/add_post' do
  tag = Tag.find(params[:id])
  post = Post.find(params[:post_id])
  tag.posts << post
  redirect "/tags/#{tag.id}"
end

put '/tags/:id/remove_post' do
  tag = Tag.find(params[:id])
  tag.posts.destroy(params[:post_id]) 
  redirect "/tags/#{tag.id}"
end
