# Admin panel
get '/admin' do
  if current_user.is_admin?
    @admins = User.where(is_admin: true)
    @users = User.where(is_admin: false)
    erb :'admin/index'
  else
    redirect('/')
  end
end

# Add Admin
post '/user/:id/promote' do
  user = User.find_by(id: params[:id])
  user.update(is_admin: true)
  redirect('/admin')
end

# Revoke Admin
post '/user/:id/revoke' do
  user = User.find_by(id: params[:id])
  user.update(is_admin: false)
  redirect('/admin')
end
