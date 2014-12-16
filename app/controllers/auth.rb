# Login
get '/login' do
  redirect("/auth/github")
end

get '/auth/github/callback' do
  auth = request.env["omniauth.auth"]
  user = User.find_or_create_by({
    uid: auth.uid,
    name: auth.info.name,
    email: auth.info.email,
    avatar_url: auth.info.image,
  })
  session[:user_id] = user['id']
  if current_user.is_admin?
    current_user.update(checked_in: true)
  end
  redirect('/')
end

# View user page
get '/user/:id' do
  @coaches = User.where(checked_in: true)
  @user = User.find_by(id: params[:id])
  erb :'auth/show'
end

# Delete a user
delete '/user/:id' do
  user = User.find_by(id: params[:id])
  user.destroy
  redirect('/admin')
end

# Logout
get '/logout' do
  current_user.update(checked_in: false)
  session['user_id'] = nil
  redirect('/')
end

