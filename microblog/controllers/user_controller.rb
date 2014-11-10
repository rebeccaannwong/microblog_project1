# ===============
#     Users
# ===============

# INDEX
get('/users') do
  @users = User.all.order('id')
  erb :'users/index' 
end

# NEW
get '/users/new' do
  erb :'/users/new'
end

# SHOW
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

# CREATE
post '/users' do
  user = User.new(params[:user])
  if user.save
    redirect("/users/#{user.id}")
  else
    redirect("/users/new")
  end
end

# EDIT
get '/users/:id/edit' do
  @user = User.find(params[:id])
  @posts = Post.all
  erb :'users/edit'
end

# UPDATE
put '/users/:id' do
  user = User.find(params[:id])
  if user.update(params[:user])
    redirect("/users/#{user.id}")
  else
    redirect("/users/#{user.id}/edit")
  end
end

#DESTROY
delete('/users/:id') do
  user = User.find(params[:id]) 
  if user.destroy
    redirect("/users")
  else
    redirect("/users/#{user.id}")
  end
end