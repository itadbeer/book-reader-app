# Islamic Book-Reader
book reader application

## Goals
1. Allah's satisfaction
2. Cultralize digital book reading
3. Learn team working
4. CV

## Requirements
- [ ] communication with publishers
- [ ] application designing and implementation
- [ ] publish to app stores
- [ ] get users
- [ ] provide server and it's needies
- [ ] licenses

## Project definition
## UX design
## UI design
## Front-end development
### Initialize Project Structure
### Design system
### Widget Design
### State management
## Back-end development
back-end will be written with dart, and we will call our Rest-ful API to 
interact with Model, and the model will take care of Database.
### Provide database documentation
Data model structure designed in ```wwww.draw.io```, and your access via [this 
link](https://drive.google.com/file/d/1vgvq7cNwpcDk_zDo7BsD71i2DSW-TX6h/view?usp=sharing)
### Create API Models
Here's a list of all different classes which works as model.
<br>
**_note that the Model is neither responsible for Data validation nor 
Authorization; these kinds of processes will be in the Controller side of 
the API._**
1. Admin

| No | Name | Parameters | Description | return Value |
|-|-|-|-|-|
| 1 | create_table |  | if the table does not exist, this method will create it. this is cool for migration and running in different environments | Void |
| 2 | add | name:str, email:str, mobile: str | adds a new admin | Boolean |
| 3 | update | admin_id:int, admin_name:str, admin_email:str,  admin_mobile:str | updates admin details based on given id | Boolean |
| 4 | delete | admin_id:int | deletes a specific admin based on given id | Boolean |
| 5 | get_all |  | get all admins with their details (id, name, email, mobile) | List |
| 6 | exist | mobile:str | check if a specific admin with a given mobile exists | Boolean |
| 7 | request_login | mobile:str | sends a random token to admin mobile and saves that token in redis Key-Value DataBase | Boolean |
| 8 | verify_login | mobile:str, user_token:str | check if the given token and mobile are pair | Boolean |

2. User

| No | Name | Parameters | Description | return Value |
|-|-|-|-|-|
| 1 | create_table |  | if the table does not exist, this method will create it. this is cool for migration and running in different environments | Boolean |
| 2 | add | mobile: str | adds a new user | Boolean |
| 3 | add_book | user_id: str, book_id: int | adds a new book for the user | Boolean |
| 4 | update | user_id: int, user_mobile: str | updates user details based on given id | Boolean |
| 5 | delete | user_id: int | deletes a specific user based on given id | Boolean |
| 6 | get_all |  | get all users with their details (id, books,mobile) | List |
| 7 | exist | mobile: str | check if a specific user with a given mobile exists | Boolean |
| 8 | request_login | mobile: str | sends a random token to user mobile and saves that token in redis Key-Value DataBase | Boolean |
| 9 | verify_login | mobile: str, user_token:str | check if the given token and mobile are pair | Boolean |

3. Book

| No | Name | Parameters | Description | return Value |
|-|-|-|-|-|
| 1 | create_table |  | if the table does not exist, this method will create it. this is cool for migration and running in different environments | Boolean |
| 2 | add | name: str, description: str, author_id: List, price: int, image: str, discount_percentage: int, pages_count: int, publisher_id: List, category_id: List, translator_id: List, publish_date: str | adds a new book | Boolean |
| 3 | update | book_id: int, name: str, description: str, author_id: List, price: int, image: str, discount_percentage: int, pages_count: int, publisher_id: List, category_id: List, translator_id: List, publish_date: str| updates book details based on given id | Boolean |
| 4 | delete | book_id: int | deletes a specific book based on given id | Boolean |
| 5 | get | book_id: int | gets book information (id, name,description,...) based on a given id | List |
| 6 | get_all |  | gets all books with their details (id, name,description,...) | List |
| 7 | count |  | gets how many books we have in total | integer |
| 8 | exist | book_id: int | check if a specific book with a given id exists | Boolean |

4. Category

| No | Name | Parameters | Description | return Value |
|-|-|-|-|-|
| 1 | create_table |  | if the table does not exist, this method will create it. this is cool for migration and running in different environments | Boolean |
| 2 | add | name: str | adds a new category | Boolean |
| 3 | update | category_id: int, category_name: str | updates category details based on given id | Boolean |
| 4 | delete | category_id: int | deletes a specific category based on given id | Boolean |
| 5 | get_all |  | gets all categories with their details (id, name) | List |
| 6 | count |  | gets how many category we have in total | integer |
| 7 | exist | category_id: int | check if a specific category with a given id exists | Boolean |

6. Publisher

| No | Name | Parameters | Description | return Value |
|-|-|-|-|-|
| 1 | create_table |  | if the table does not exist, this method will create it. this is cool for migration and running in different environments | Boolean |
| 2 | add | name: str, description: str | adds a new publisher | Boolean |
| 3 | update | publisher_id: int, publisher_name: str, publisher_description: str | updates publisher based on given id | Boolean |
| 4 | delete | publisher_id: int | deletes a specific publisher based on given id | Boolean |
| 5 | get_all |  | gets all publishers with their details (id, name, description) | List |
| 6 | count |  | gets how many publisher we have in total | integer |
| 7 | exist | publisher_id: int | check if a specific publisher with a given id exists | Boolean |

8. Author

| No | Name | Parameters | Description | return Value |
|-|-|-|-|-|
| 1 | create_table |  | if the table does not exist, this method will create it. this is cool for migration and running in different environments | Boolean |
| 2 | add | name: str, description: str | adds a new author | Boolean |
| 3 | update | author_id: int, author_name: str, author_description: str | updates author based on given id | Boolean |
| 4 | delete | author_id: int | deletes a specific author based on given id | Boolean |
| 5 | get_all |  | gets all authors with their details (id, name, description) | List |
| 6 | count |  | gets how many author we have in total | integer |
| 7 | exist | author_id: int | check if a specific author with a given id exists | Boolean |

10. Translator

| No | Name | Parameters | Description | return Value |
|-|-|-|-|-|
| 1 | create_table |  | if the table does not exist, this method will create it. this is cool for migration and running in different environments | Boolean |
| 2 | add | name: str, description: str | adds a new translator | Boolean |
| 3 | update | translator_id: int, translator_name: str, translator_description: str | updates translator based on given id | Boolean |
| 4 | delete | translator_id: int | deletes a specific translator based on given id | Boolean |
| 5 | get_all |  | gets all translators with their details (id, name, description) | List |
| 6 | count |  | gets how many translator we have in total | integer |
| 7 | exist | translator_id: int | check if a specific translator with a given id exists | Boolean |

11. SMS
12. SMS Token
### Provide API routes
### Write Test API collection
## Test

## App features
- [ ] Authentication & Authentication
- [ ] My library
- [ ] purchase
- [ ] Search
- [ ] Category
- [ ] Book information
- [ ] Discovery Page
- [ ] Open a Book
- [ ] Book Download Management
