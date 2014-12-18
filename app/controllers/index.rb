get '/' do
  @user_requests = Request.all.order('created_at desc')
  @unhelped_requests = Request.where(coach_id: nil)
  @coaches = User.where(checked_in: true)
  erb :index
end
