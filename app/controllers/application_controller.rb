class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  #updating a task
 post "/tasks" do 
  task = Task.create(item: params[:item],
  importance: params[:importance],
  category_id: params[:category_id]
  )
  task.to_json(include: {category: {only: [:category]}})
 end

#fetching the tasks
 get "/tasks" do
  tasks = Task.all.all_importance
  tasks.to_json(include: :category)
 end

 #sorting the data according to importance

 get "/tasks-low" do 
  tasks = Task.filter_importance('low')
  tasks.to_json(include: { category: {only: [:category]}})
 end

 get "/tasks-medium" do 
  tasks = Task.filter_importance('medium')
  tasks.to_json(include: { category: {only: [:category]}})
 end

 get "/tasks-high" do 
  tasks = Task.filter_importance('high')
  tasks.to_json(include: { category: {only: [:category]}})
 end

#making a small change on a task
 patch "/tasks/:id" do
  task = Task.find(params[:id])
  task.update(item: params[:item],
    importance: params[:importance],
    category_id: params[:category_id]
  )
  task.to_json(include: { category: {only: [:category]} })
end

#to delete a task
delete "/tasks/:id" do
  task = Task.find(params[:id])
  task.destroy
  task.to_json
end

#getting one task
get "/tasks/:id" do
  tasks = Task.find(params[:id])
  # tasks.to_json
  tasks.to_json(include: { category: {only: [:category]} })
end

#arrange tasks alphabetically
get "/tasks-alphabetical" do
  tasks = Task.all_items
  tasks.to_json(include: { category: {only: [:category]} })
end

#fetching the categories

get "/categories" do
  categories = Category.all
  categories.to_json
end


require 'sinatra'
require 'json'
require 'jwt'
require 'bcrypt'

# Set secret key for JWT
SECRET_KEY = 'my_secret_key'

# Authenticate user and generate JWT token
post '/login' do
  # Get user credentials from request body
  user_credentials = JSON.parse(request.body.read)

  # Find user by email
  user = User.find_by(email: user_credentials['email'])

  # Check if user exists and password is correct
  if user && user.verify_password(user_credentials['password'])
    # Generate JWT token
    token = JWT.encode({ user_id: user.id }, SECRET_KEY, 'HS256')

    # Return token in response
    { token: token }.to_json
  else
    # Return error message
    { error: 'Invalid email or password' }.to_json
  end
end



end
