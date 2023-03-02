puts "🌱 Seeding tasks..."

# Seed your database here

# require 'bcrypt'

# Delete existing users from database


# Seed data for users
User.create(full_name: 'John Doe', email: 'johndoe@example.com', password_hash: 'password')
User.create(full_name: 'Jane Doe', email: 'janedoe@example.com', password_hash: 'password')
User.create(full_name: 'Bob Smith', email: 'bobsmith@example.com', password_hash: 'password')






Category.create(id: 1, category: "chores")
Category.create(id: 2, category: "work")
Category.create(id: 3, category: "exercise")

Category.create(id: 4, category: "groceries")
Category.create(id: 5, category: "school")



Task.create(item: "clean bathroom", importance: "low", category_id: 1, user_id: 2)
Task.create(item: "finish project", importance: "high", category_id: 2, user_id: 3)
Task.create(item: "walk on treadmill", importance: "medium", category_id: 3, user_id: 1)
Task.create(item: "walk dog", importance: "medium", category_id: 3, user_id: 2)
Task.create(item: "take thrash out", importance: "high", category_id: 1, user_id: 1)
Task.create(item: "buy cabbages", importance: "low", category_id: 4, user_id: 3)
Task.create(item: "Pick Jonny from skul", importance: "high",category_id: 5, user_id: 1)
 



puts "✅ Done seeding!"
