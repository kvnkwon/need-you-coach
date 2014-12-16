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
  redirect('/')
end

# View user page
get '/user/:id' do
  @user = User.find_by(id: params[:id])
  erb :'auth/show'
end

# Admin panel
get '/admin' do
  if current_user.is_admin?
    @admins = User.where(is_admin: true)
    @users = User.where(is_admin: false)
    erb :'admin/index'
  else
    redirect('/')
  end
end

# Logout
get '/logout' do
  current_user.update(checked_in: false)
  session['user_id'] = nil
  redirect('/')
end

