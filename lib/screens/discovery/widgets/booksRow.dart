import 'package:ibr/api/books.dart';
import 'package:ibr/ibr.dart';
import 'package:ibr/models/book.dart';
import 'package:ibr/models/category.dart';
import 'package:intl/intl.dart';

Container showBookCard(BuildContext context, Book book) {
  var money =
      NumberFormat.currency(locale: "en_US", symbol: "", decimalDigits: 0);
  final double finalPrice =
      (book.price / 100) * (100 - book.discountPercentage);
  return Container(
    width: 150,
    margin: EdgeInsets.only(left: 8, top: 16),
    child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.12), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: GestureDetector(
                  onTap: () => {
                    Navigator.pushNamed(context, '/singleProduct',
                        arguments: book)
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      // placeholder: (context, url) =>
                      //     CachedNetworkImage(imageUrl: ""),
                      imageUrl: book.image,
                      height: 192,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => {
                  Navigator.pushNamed(context, '/singleProduct',
                      arguments: book)
                },
                child: Text(book.name,
                    style: TextStyle(fontSize: 14, color: Colors.black)),
              ),
              Container(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  children: [
                    book.discountPercentage > 0
                        ? Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                width: 32,
                                height: 22.0,
                                color: Colors.transparent,
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: myTheme.primaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0))),
                                    child: Center(
                                      child: Text(
                                        "${book.discountPercentage}%",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                              ),
                            ],
                          )
                        : Column(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        book.discountPercentage > 0
                            ? Row(
                                children: [
                                  Text(money.format(book.price),
                                      style: TextStyle(
                                          color: onSurfaceMediumEmphasis,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: 14))
                                ],
                              )
                            : Row(),
                        Row(
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: money.format(finalPrice),
                                    style: TextStyle(
                                        color: myTheme.primaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))),
                            Text(" تومان",
                                style: TextStyle(
                                    color: onSurfaceMediumEmphasis,
                                    fontSize: 12))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

class BooksRow extends StatelessWidget {
  final String title;
  final Category category;
  const BooksRow({Key key, this.title, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Book> recentBooks = Provider.of<List<Book>>(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      BooksRowHeader(
          title: title,
          moreButtonAction: category.id == null
              ? () {
                  Navigator.pushNamed(context, '/allBooks');
                }
              : () {
                  Navigator.pushNamed(context, '/category',
                      arguments: category);
                }),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // Display recent Books
            category.id == null
                ? showRecentBooks(context, recentBooks)
                : showCategoryBooks(context, category.id)
          ],
        ),
      )
    ]);
  }

  Row showRecentBooks(BuildContext context, List<Book> books) {
    List<Widget> booksWidgets = [];
    books.forEach((book) {
      booksWidgets.add(showBookCard(context, book));
    });
    return Row(children: booksWidgets);
  }

  showCategoryBooks(BuildContext context, int categorId) {
    // get 10 recent books for this specific category
    List<Widget> booksWidgets = [];
    return FutureBuilder(
      future: getBooks(limit: 10, categoryId: category.id), // async work
      builder: (BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return LoadingDialog();
          default:
            if (snapshot.hasError)
              return Text(
                'مشکلی رخ داده',
                style: TextStyle(color: error),
              );
            else {
              snapshot.data.forEach((book) {
                booksWidgets.add(showBookCard(context, book));
              });
              return Row(children: booksWidgets);
            }
        }
      },
    );
  }
}

class BooksRowHeader extends StatelessWidget {
  final String title;
  final Function moreButtonAction;
  const BooksRowHeader({
    Key key,
    this.title,
    this.moreButtonAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
      margin: EdgeInsets.only(top: 24),
      child: Row(
        children: <Widget>[
          Text(title,
              style: TextStyle(
                  color: onSurfaceHighEmphasis,
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
          Spacer(),
          GestureDetector(
            onTap: moreButtonAction,
            child: Text('نمایش بیشتر',
                style: TextStyle(color: myTheme.primaryColor, fontSize: 14)),
          ),
          Icon(Icons.chevron_right, color: myTheme.primaryColor)
        ],
      ),
    );
  }
}
