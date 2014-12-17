# View all coaches who are checked in
get '/coaches' do
  @coaches = User.where(checked_in: true)
  @all_coaches = User.where(is_admin: true)
  erb :'coach/show'
end
