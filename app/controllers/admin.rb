# Admin panel
get '/admin' do
  @coaches = User.where(checked_in: true)
  if current_user.is_admin?
    @admins = User.where(is_admin: true).sort_by{ |user| user.name }
    @users = User.where(is_admin: false).sort_by{ |user| user.name }
    erb :'admin/index'
  else
    redirect('/')
  end
end

# Add Admin
put '/user/:id/promote' do
  user = User.find_by(id: params[:id])
  user.update(is_admin: true)
  redirect('/admin')
end

# Revoke Admin
put '/user/:id/revoke' do
  user = User.find_by(id: params[:id])
  user.update(is_admin: false)
  redirect('/admin')
end
