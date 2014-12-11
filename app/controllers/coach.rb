# View all coaches who are checked in
get '/coaches' do
  @coaches = User.where(checked_in: true)
  erb :'coach/show'
end

# Check in
get '/coach/check-in' do
  if current_user.is_admin?
    current_user.update(checked_in: true)
    redirect ('/coaches')
  else
    redirect('/')
  end
end
