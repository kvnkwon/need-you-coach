# Make a new help request
before '/request/'
get '/request/new' do
  if current_user
    erb :'request/new'
  else
    redirect('/login')
  end
end

post '/request/new' do
  user_request = current_user.requests.create(params[:request])
  if user_request.save
    redirect("/success")
  else
    session[:error] = user_request.errors.messages
    redirect('/request/new')
  end
end

# View a help request
get '/request/:id' do
  @user_request = Request.find_by(id: params[:id])
  if @user_request
    erb :'request/show'
  else
    redirect('/')
  end
end

# Delete a help request
delete '/request/:id' do
  user_request = Request.find_by(id: params[:id])
  user_request.destroy
  redirect('/')
end
