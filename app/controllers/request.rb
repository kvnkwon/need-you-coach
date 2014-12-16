# Make a new help request
get '/request/new' do
  @coaches = User.where(checked_in: true)
  if current_user
    erb :'request/new'
  else
    redirect('/login')
  end
end

post '/request/new' do
  user_request = Request.create(params[:request])
  user_request.update(student_id: current_user.id)
  if user_request.save
    redirect("/")
  else
    session[:error] = user_request.errors.messages
    redirect('/request/new')
  end
end

# View a help request
get '/request/:id' do
  @coaches = User.where(checked_in: true)
  @user_request = Request.find_by(id: params[:id])
  if @user_request
    erb :'request/show'
  else
    redirect('/')
  end
end

# Coach mark a help request
post '/request/:id' do
  user_request = Request.find_by(id: params[:id])
  if current_user.is_admin?
    user_request.update(coach_id: current_user.id)
    user_request.coach.to_json
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
