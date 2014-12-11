# View a help request

get '/request/:id' do
  @request = Request.find_by(id: params[:id])
  if @request
    erb :'request/show'
  else
    redirect('/')
  end
end

# Make a new help request
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


