def authenticated?
  session[:access_token]
end

def authenticate!
  erb :"login", :locals => {:client_id => CLIENT_ID}
end
