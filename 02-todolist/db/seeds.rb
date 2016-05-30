# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

TodoItem.delete_all
TodoList.delete_all
Profile.delete_all
User.delete_all

User.create! ([
	{username: "Fiorina", password_digest: "1234"},
	{username: "Trump", password_digest: "1234"},
	{username: "Carson", password_digest: "1234"},
	{username: "Clinton", password_digest: "1234"}
])

user_1 = User.where(username:"Fiorina").first
user_2 = User.where(username:"Trump").first
user_3 = User.where(username:"Carson").first
user_4 = User.where(username:"Clinton").first

Profile.create! ([
	{first_name: "Carly", 	last_name: "Fiorina", 	gender: "female", 	birth_year: 1954, user_id:user_1.id},
	{first_name: "Donald", 	last_name: "Trump", 	gender: "male", 	birth_year: 1946, user_id:user_2.id},
	{first_name: "Ben", 	last_name: "Carson", 	gender: "male", 	birth_year: 1951, user_id:user_3.id},
	{first_name: "Hillary", last_name: "Clinton", 	gender: "female", 	birth_year: 1947, user_id:user_4.id}
])

TodoList.create! ([
	{list_name: "list_1", list_due_date: Date.today, user_id: user_1.id},
	{list_name: "list_1", list_due_date: Date.today, user_id: user_2.id},
	{list_name: "list_1", list_due_date: Date.today, user_id: user_3.id},
	{list_name: "list_1", list_due_date: Date.today, user_id: user_4.id}
])

todo_lists = TodoList.all
todo_lists.each do |t|
	TodoItem.create! ([
		{title: "item_1", description: "description_item_1", due_date: Date.today, todo_list_id: t.id},
		{title: "item_2", description: "description_item_2", due_date: Date.today, todo_list_id: t.id},
		{title: "item_3", description: "description_item_3", due_date: Date.today, todo_list_id: t.id},
		{title: "item_4", description: "description_item_4", due_date: Date.today, todo_list_id: t.id},
		{title: "item_5", description: "description_item_5", due_date: Date.today, todo_list_id: t.id}
	])
end






