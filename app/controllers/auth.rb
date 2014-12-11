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

# Logout
get '/logout' do
  session['user_id'] = nil
  redirect('/')
end

