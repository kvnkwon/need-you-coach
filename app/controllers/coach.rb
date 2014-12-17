# View all coaches who are checked in
get '/coaches' do
  @coaches = User.where(checked_in: true)
  erb :'coach/show'
end
