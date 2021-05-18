import 'package:ibr/ibr.dart';
import 'package:ibr/models/author.dart';
import 'package:ibr/models/book.dart';
import 'package:ibr/models/category.dart';
import 'package:ibr/models/publisher.dart';
import 'package:ibr/models/translator.dart';
import 'package:ibr/screens/book/widgets/footerPurchaseBar.dart';
import 'package:ibr/screens/book/widgets/purchaseConfirmation.dart';
import 'package:intl/intl.dart';

class BookScreen extends StatelessWidget {
  getAuthorsInfo(context, Book book) {
    List<Widget> authors = [];
    for (var authorId in book.authorId) {
      Author author = getAuthor(context, authorId: authorId);
      authors.add(GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/author', arguments: author);
        },
        child: Text(
            "${author.name}${authorId != book.authorId.last ? '،' : ''}",
            style: TextStyle(color: myTheme.primaryColor, fontSize: 16)),
      ));
    }
    return Row(children: authors);
  }

  getTranslatorsInfo(BuildContext context, Book book) {
    List<Widget> translators = [];
    for (var translatorId in book.translatorId) {
      Translator translator =
          getTranslator(context, translatorId: translatorId);
      translators.add(GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/translator', arguments: translator);
        },
        child: Text(
            "${translator.name}${translatorId != book.translatorId.last ? '،' : ''}",
            style: TextStyle(color: myTheme.primaryColor, fontSize: 16)),
      ));
    }
    return Row(children: translators);
  }

  getCategoriesInfo(context, Book book) {
    List<Widget> categories = [];
    for (int theCategoryId in book.categoryId) {
      Category category = getCategory(context, categoryId: theCategoryId);
      categories.add(GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/category', arguments: category);
        },
        child: Text(
            "${category.name}${theCategoryId != book.categoryId.last ? '،' : ''}",
            style: TextStyle(color: myTheme.primaryColor, fontSize: 16)),
      ));
    }
    return Row(children: categories);
  }

  getPublishersInfo(BuildContext context, Book book) {
    List<Widget> publishers = [];
    for (var publisherId in book.publisherId) {
      Publisher publisher = getPublisher(context, publisherId: publisherId);
      publishers.add(GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/publisher', arguments: publisher);
        },
        child: Text(
            "${publisher.name}${publisherId != book.publisherId.last ? '،' : ''}",
            style: TextStyle(color: myTheme.primaryColor, fontSize: 16)),
      ));
    }
    return Row(children: publishers);
  }

  @override
  Widget build(BuildContext context) {
    final Book book = ModalRoute.of(context).settings.arguments;
    var money =
        NumberFormat.currency(locale: "en_US", symbol: "", decimalDigits: 0);
    final double finalPrice =
        (book.price / 100) * (100 - book.discountPercentage);
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: TopBar(displayGoBackButton: true, displayActionButton: false),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Image.network(
                  book.image,
                  height: 288,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 24, bottom: 24),
                child: Text(
                  book.name,
                  style: TextStyle(
                      fontSize: 20,
                      color: onSurfaceHighEmphasis,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                children: <Widget>[
                  book.discountPercentage > 0
                      ? Container(
                          margin: EdgeInsets.only(left: 8),
                          width: 32,
                          height: 22.0,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                color: myTheme.primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            child: Center(
                              child: Text(
                                "${book.discountPercentage}%",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  book.discountPercentage > 0
                      ? Container(
                          margin: EdgeInsets.only(right: 8, left: 8),
                          child: Text(book.price.toString(),
                              style: TextStyle(
                                  color: onSurfaceMediumEmphasis,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 14)),
                        )
                      : Container(),
                  RichText(
                      text: TextSpan(
                          text: money.format(finalPrice),
                          style: TextStyle(
                              color: myTheme.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500))),
                  Text(" تومان",
                      style: TextStyle(
                          color: onSurfaceMediumEmphasis, fontSize: 12))
                ],
              ),
              Row(children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      if (isLoggedIn()) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                PurchaseConfirmationDialog());
                      } else {
                        Navigator.pushNamed(context, '/login');
                      }
                    },
                    child: Container(
                      width: 96,
                      height: 36,
                      margin: EdgeInsets.only(top: 16, bottom: 24),
                      decoration: BoxDecoration(
                          color: myTheme.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Center(
                        child: Text(
                          "خرید",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
              Column(
                children: [
                  Row(
                    children: [
                      Text("نویسنده: ",
                          style: TextStyle(
                              color: onSurfaceMediumEmphasis, fontSize: 16)),
                      getAuthorsInfo(context, book),
                    ],
                  ),
                  Row(
                    children: [
                      Text("مترجم: ",
                          style: TextStyle(
                              color: onSurfaceMediumEmphasis, fontSize: 16)),
                      getTranslatorsInfo(context, book),
                    ],
                  ),
                  Row(
                    children: [
                      Text("ناشر: ",
                          style: TextStyle(
                              color: onSurfaceMediumEmphasis, fontSize: 16)),
                      getPublishersInfo(context, book),
                    ],
                  ),
                  Row(
                    children: [
                      Text("سال نشر: ",
                          style: TextStyle(
                              color: onSurfaceMediumEmphasis, fontSize: 16)),
                      Text(book.publishDate,
                          style: TextStyle(
                              color: onSurfaceHighEmphasis, fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("تعداد صفحات: ",
                          style: TextStyle(
                              color: onSurfaceMediumEmphasis, fontSize: 16)),
                      Text(book.pagesCount.toString(),
                          style: TextStyle(
                              color: onSurfaceHighEmphasis, fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("دسته بندی ها: ",
                          style: TextStyle(
                              color: onSurfaceMediumEmphasis, fontSize: 16)),
                      getCategoriesInfo(context, book),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: EdgeInsets.only(top: 24, bottom: 16),
                      child: Text("توضیحات",
                          style: TextStyle(
                              color: onSurfaceHighEmphasis,
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 56),
                      child: Text(book.description,
                          style: TextStyle(
                              color: onSurfaceMediumEmphasis, fontSize: 16)))
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          FooterPurchaseBar(book: book, finalPrice: money.format(finalPrice)),
    );
  }
}
