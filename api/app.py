from config import *
from functools import wraps
from admin import Admin
from user import User
from book import Book
from category import Category
from author import Author
from publisher import Publisher
from translator import Translator
from flask import Flask, jsonify, request, abort, Blueprint
from flask_cors import CORS

if __name__ == "__main__":
    request_version = None

    def require_authentication(view_function):
        @wraps(view_function)
        def decorated_function(*args, **kwargs):
            if request.headers.get('secret_key') and request.headers.get('secret_key') == API_SECRET_KEY:
                return view_function(*args, **kwargs)
            else:
                abort(401)
        return decorated_function

    def versioning(view_function):
        @wraps(view_function)
        def decorated_function(*args, **kwargs):
            if request.headers.get('api_version') in API_VERSIONS:
                global request_version
                request_version = request.headers.get('api_version')
                return view_function(*args, **kwargs)
            else:
                abort(404)
        return decorated_function

    app = Flask(__name__)
    app.config['CORS_HEADERS'] = 'Content-Type'
    app.config['SECRET_KEY'] = API_SECRET_KEY
    CORS(app)

    # Instantiating Models
    admin = Admin()
    user = User()
    book = Book()
    category = Category()
    author = Author()
    publisher = Publisher()
    translator = Translator()

    # Routes
    # API General Routes
    @app.route('/')
    @versioning
    def test_route():
        return jsonify({'message': f'This is a test route for API version {request_version}'})

    # User Routes
    @app.route('/user/request_login', methods=['POST'])
    @require_authentication
    @versioning
    def request_login():
        mobile = request.values.get('mobile')
        if len(mobile) > 0:
            return jsonify(result=user.request_login(mobile))
        else:
            abort(400)

    @app.route('/user/verify_login', methods=['POST'])
    @require_authentication
    @versioning
    def verify_login():
        mobile = request.values.get('mobile')
        token = request.values.get('token')
        if len(mobile) > 0 and len(token) > 0:
            return jsonify(result=user.verify_login(mobile, token))
        else:
            abort(400)
    # Books Routes

    @app.route('/book/add', methods=['POST'])
    @require_authentication
    @versioning
    def add_book():
        name = request.values.get('name')
        description = request.values.get('description')
        author_id = list(
            map(int, request.values.get('author_id').split(',')))
        price = request.values.get('price')
        image = request.values.get('image')
        discount_percentage = request.values.get('discount_percentage')
        pages_count = request.values.get('pages_count')
        publisher_id = list(
            map(int, request.values.get('publisher_id').split(',')))
        category_id = list(
            map(int, request.values.get('category_id').split(',')))
        if request.values.get('translator_id') != "":
            translator_id = list(
                map(int, request.values.get('translator_id').split(',')))
        else:
            translator_id = '{}'
        publish_date = request.values.get('publish_date')
        return jsonify(result=book.add(name=name, description=description,
                                       author_id=author_id,
                                       price=price, image=image,
                                       discount_percentage=discount_percentage,
                                       pages_count=pages_count,
                                       publisher_id=publisher_id,
                                       category_id=category_id,
                                       translator_id=translator_id,
                                       publish_date=publish_date
                                       ))

    @app.route('/book/update/<book_id>', methods=['PUT'])
    @require_authentication
    @versioning
    def update_book(book_id):
        name = request.values.get('name')
        description = request.values.get('description')
        author_id = list(
            map(int, request.values.get('author_id').split(',')))
        price = request.values.get('price')
        image = request.values.get('image')
        discount_percentage = request.values.get('discount_percentage')
        pages_count = request.values.get('pages_count')
        publisher_id = list(
            map(int, request.values.get('publisher_id').split(',')))
        category_id = list(
            map(int, request.values.get('category_id').split(',')))
        if request.values.get('translator_id') != "":
            translator_id = list(
                map(int, request.values.get('translator_id').split(',')))
        else:
            translator_id = '{}'
        publish_date = request.values.get('publish_date')
        if book.exist(book_id):
            return jsonify(status=book.update(book_id=book_id, name=name,
                                              description=description,
                                              author_id=author_id,
                                              price=price, image=image,
                                              discount_percentage=discount_percentage,
                                              pages_count=pages_count,
                                              publisher_id=publisher_id,
                                              category_id=category_id,
                                              translator_id=translator_id,
                                              publish_date=publish_date))
        else:
            abort(404)

    @app.route('/book/delete/<book_id>', methods=['DELETE'])
    @require_authentication
    @versioning
    def delete_book(book_id):
        if book.exist(book_id):
            return jsonify(result=book.delete(book_id))
        else:
            abort(404)

    @app.route('/book/<book_id>')
    @versioning
    @require_authentication
    def get_book(book_id):
        if book.exist(book_id):
            return jsonify(result=book.get(book_id))
        else:
            abort(404)

    @app.route('/book/all')
    @versioning
    @require_authentication
    def get_all_books():
        return jsonify(results=book.get_all())
    # Category

    @app.route('/category/add', methods=['POST'])
    @versioning
    @require_authentication
    def add_category():
        name = request.values.get('name')
        if len(name) > 0:
            return jsonify(result=category.add(name))
        else:
            abort(400)

    @app.route('/category/update/<category_id>', methods=['PUT'])
    @versioning
    @require_authentication
    def update_category(category_id):
        if not category.exist(category_id):
            abort(404)
        else:
            name = request.values.get('name')
            if len(name) > 0:
                return jsonify(result=category.add(name))
            else:
                abort(404)

    @app.route('/category/delete/<category_id>', methods=['DELETE'])
    @versioning
    @require_authentication
    def delete_category(category_id):
        if category.exist(category_id):
            return jsonify(result=category.delete(category_id))
        else:
            abort(404)

    @app.route('/category/<category_id>')
    @versioning
    @require_authentication
    def get_category(category_id):
        if category.exist(category_id):
            return jsonify(result=category.get(category_id))
        else:
            abort(404)

    @app.route('/category/all')
    @versioning
    @require_authentication
    def get_all_categories():
        return jsonify(results=category.get_all())
    # Publisher

    @app.route('/publisher/add', methods=['POST'])
    @versioning
    @require_authentication
    def add_publisher():
        name = request.values.get('name')
        description = request.values.get('description')
        if len(name) > 0:
            return jsonify(result=publisher.add(name, description))
        else:
            abort(400)

    @app.route('/publisher/update/<publisher_id>', methods=['PUT'])
    @versioning
    @require_authentication
    def update_publisher(publisher_id):
        if not publisher.exist(publisher_id):
            abort(404)
        else:
            name = request.values.get('name')
            description = request.values.get('description')
            if len(name) > 0:
                return jsonify(result=publisher.add(name, description))
            else:
                abort(404)

    @app.route('/publisher/delete/<publisher_id>', methods=['DELETE'])
    @versioning
    @require_authentication
    def delete_publisher(publisher_id):
        if publisher.exist(publisher_id):
            return jsonify(result=publisher.delete(publisher_id))
        else:
            abort(404)

    @app.route('/publisher/<publisher_id>')
    @versioning
    @require_authentication
    def get_publisher(publisher_id):
        if category.exist(publisher_id):
            return jsonify(result=publisher.get(publisher_id))
        else:
            abort(404)

    @app.route('/publisher/all')
    @versioning
    @require_authentication
    def get_all_publishers():
        return jsonify(results=publisher.get_all())
    # Author

    @app.route('/author/add', methods=['POST'])
    @versioning
    @require_authentication
    def add_author():
        name = request.values.get('name')
        description = request.values.get('description')
        if len(name) > 0:
            return jsonify(result=author.add(name, description))
        else:
            abort(400)

    @app.route('/author/update/<author_id>', methods=['PUT'])
    @versioning
    @require_authentication
    def update_author(author_id):
        if not author.exist(author_id):
            abort(404)
        else:
            name = request.values.get('name')
            description = request.values.get('description')
            if len(name) > 0:
                return jsonify(result=author.add(name, description))
            else:
                abort(404)

    @app.route('/author/delete/<author_id>', methods=['DELETE'])
    @versioning
    @require_authentication
    def delete_author(author_id):
        if author.exist(author_id):
            return jsonify(result=author.delete(author_id))
        else:
            abort(404)

    @app.route('/author/<author_id>')
    @versioning
    @require_authentication
    def get_author(author_id):
        if category.exist(author_id):
            return jsonify(result=author.get(author_id))
        else:
            abort(404)

    @app.route('/author/all')
    @versioning
    @require_authentication
    def get_all_authors():
        return jsonify(results=author.get_all())

    # Translator
    @app.route('/translator/add', methods=['POST'])
    @versioning
    @require_authentication
    def add_translator():
        name = request.values.get('name')
        description = request.values.get('description')
        if len(name) > 0:
            return jsonify(result=translator.add(name, description))
        else:
            abort(400)

    @app.route('/translator/update/<translator_id>', methods=['PUT'])
    @versioning
    @require_authentication
    def update_translator(translator_id):
        if not translator.exist(translator_id):
            abort(404)
        else:
            name = request.values.get('name')
            description = request.values.get('description')
            if len(name) > 0:
                return jsonify(result=translator.add(name, description))
            else:
                abort(404)

    @app.route('/translator/delete/<translator_id>', methods=['DELETE'])
    @versioning
    @require_authentication
    def delete_translator(translator_id):
        if translator.exist(translator_id):
            return jsonify(result=translator.delete(translator_id))
        else:
            abort(404)

    @app.route('/translator/<translator_id>')
    @versioning
    @require_authentication
    def get_translator(translator_id):
        if category.exist(translator_id):
            return jsonify(result=translator.get(translator_id))
        else:
            abort(404)

    @app.route('/translator/all')
    @versioning
    @require_authentication
    def get_all_translators():
        return jsonify(results=translator.get_all())

    app.run(host=API_HOST, port=API_PORT, debug=API_DEBUG)
