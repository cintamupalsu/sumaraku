# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "admin@jdf.com", password: "adminjdf", name: "Admin", developer: 1)
User.create(email: "editor@jdf.com", password: "editorjdf", name: "Editor", developer: 0)
UserRole.create(content: "Can manage user")
UserRole.create(content: "Can manage news")
UserRoleTransaction.create(user_id: 1, user_role_id: 1)  #Set first user as Admin
UserRoleTransaction.create(user_id: 1, user_role_id: 2)  #Set first user as Editor
UserRoleTransaction.create(user_id: 2, user_role_id: 2)  #Set second user as Editor
