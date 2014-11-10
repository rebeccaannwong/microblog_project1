# INDEX
get '/posts' do
	@posts = Post.all
	erb :'posts/index'
end

# NEW
get '/posts/new' do
  @users = User.all
  @tags = Tag.all
	erb :'posts/new'
end

# SHOW
get '/posts/:id' do
	@user = User.all
	@post = Post.find(params[:id])
	erb :'posts/show'
end

post '/posts' do
	post = Post.create(params[:post])
	# params[:tag_id] is now an array so we have to loop thru it
	params[:tag_id].each do |id|
		post.tags << Tag.find(id)
	end

	redirect("/posts/#{post.id}")
	# else
	# 	redirect("/posts/new")
	 
end

# EDIT
get '/posts/:id/edit' do
	@post = Post.find(params[:id])
  @users = User.all
  @tags = Tag.all
	erb :'posts/edit'
end

# UPDATE
put '/posts/:id' do
	post = Post.find(params[:id])
	if post.update(params[:post])
		redirect("/posts/#{post.id}")
	else
		redirect("/posts/#{post.id}/edit")
	end
end

# DESTROY
delete '/posts/:id' do
	micropost = Post.find(params[:id])
	if micropost.destroy
		redirect('/posts')
	else
		redirect("/posts/#{post.id}")
	end
end


