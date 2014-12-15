get '/' do
  @user_requests = Request.all.order('created_at desc')
  @help_needed_requests = Request.where(coach_id: nil)
  @coaches = User.where(checked_in: true)
  erb :index
end

get '/success' do
  erb :success
end
