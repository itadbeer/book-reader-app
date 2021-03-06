from functools import wraps
from config import *
from admin import Admin
from user import User
from book import Book
from author import Author
from publisher import Publisher
from translator import Translator
from flask import Flask, jsonify, request, abort
from flask_cors import CORS
from flask_httpauth import HTTPDigestAuth

if __name__ == "__main__":
    # Instantiating Models
    admin = Admin()
    user = User()
    book = Book()
    author = Author()
    publisher = Publisher()
    translator = Translator()

    app = Flask(__name__)
    app.config['CORS_HEADERS'] = 'Content-Type'
    app.config['SECRET_KEY'] = API_SECRET_KEY
    auth = HTTPDigestAuth()
    CORS(app)


    def require_authentication(view_function):
        @wraps(view_function)
        # the new, post-decoration function. Note *args and **kwargs here.
        def decorated_function(*args, **kwargs):
            if request.headers.get('secret_key') and request.headers.get(
                    'secret_key') == API_SECRET_KEY:
                return view_function(*args, **kwargs)
            else:
                abort(401)

        return decorated_function


    # Routes
    ## API General Routes
    @app.route('/')
    def test_route():
        return jsonify({'message': 'This is a test route'})


    ## User Routes
    @app.route('/user/request_login', methods=['POST'])
    @require_authentication
    def request_login():
        mobile = request.values.get('mobile')
        return jsonify(result=user.request_login(mobile))


    @app.route('/user/verify_login', methods=['POST'])
    @require_authentication
    def verify_login():
        mobile = request.values.get('mobile')
        token = request.values.get('token')
        return jsonify(result=user.verify_login(mobile, token))


    ## Books Routes
    @require_authentication
    @app.route('/book/add', methods=['POST'])
    def add_book():
        name = request.values.get('name')
        description = request.values.get('description')
        author_id = request.values.get('author_id')
        price = request.values.get('price')
        image = request.values.get('image')
        discount_percentage = request.values.get('discount_percentage')
        pages_count = request.values.get('pages_count')
        publisher_id = request.values.get('publisher_id')
        category_id = request.values.get('category_id')
        translator_id = request.values.get('translator_id')
        publish_date = request.values.get('publish_date')
        return jsonify(result=
            book.add(name=name, description=description, author_id=author_id,
                     price=price, image=image,
                     discount_percentage=discount_percentage,
                     pages_count=pages_count, publisher_id=publisher_id,
                     category_id=category_id,
                     translator_id=translator_id, publish_date=publish_date
                     ))


    @require_authentication
    @app.route('/book/<book_id>')
    def get_book(book_id):
        if book.exist(book_id):
            return jsonify(result=book.get(book_id))
        else:
            abort(400)


    @require_authentication
    @app.route('/book/all')
    def get_all_books():
        return jsonify(book.get_all())


    app.run(host=API_HOST, port=API_PORT, debug=API_DEBUG)
