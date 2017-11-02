# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  roles = Role.create([{ name: 'admin' }, { name: 'user' }, {name: 'trainer'}]) if Role.last.nil?

  if User.last.nil?
    admin = User.create(username: 'admin', email: 'admin@test.com', password: 'admin@test123')
    admin.add_role :admin

    trainer1 = User.create({
      	username: 'nike',
      	email: 'trainer1@test.com', 
      	password: '12345678'})
    trainer1.add_role :trainer

    trainer2 = User.create({
      	username: 'addidas', 
      	email: 'trainer2@test.com', 
      	password: '12345678'})
    trainer2.add_role :trainer

    user1 = User.create({
      	username: 'puma', 
      	email: 'user1@test.com', 
      	password: '12345678'})
    user1.add_role :user

    user2 = User.create({
      	username: 'silver', 
      	email: 'user2@test.com', 
      	password: '12345678'})
    user2.add_role :user
  end