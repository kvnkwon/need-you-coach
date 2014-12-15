get '/' do
  @user_requests = Request.all.order('created_at desc')
  @coaches = User.where(checked_in: true)
  erb :index
end

get '/success' do
  erb :success
end
