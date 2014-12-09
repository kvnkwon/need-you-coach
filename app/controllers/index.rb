get '/' do
  @requests = Request.all
  erb :index
end

get '/success' do
  erb :success
end
