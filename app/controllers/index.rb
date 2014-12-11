get '/' do
  @user_requests = Request.all
  @coaches = User.where(checked_in: true)
  erb :index
end

get '/success' do
  erb :success
end
