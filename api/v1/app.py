from user import User
user = User()
user.add("09215403947")
print(user.exist("09215403947"))
user.add_book(25,1)
print(user.get_all())