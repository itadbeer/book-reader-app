import 'package:ibr/ibr.dart';
import 'package:ibr/models/book.dart';
import 'package:ibr/models/publisher.dart';
import 'package:ibr/screens/book/widgets/horizontalProductCard.dart';

class TranslatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Publisher publisher = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      extendBody: true,
      appBar: TopBar(
          title: publisher.name,
          displayGoBackButton: true,
          displayActionButton: false),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(children: <Widget>[
                Row(children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Text(
                      "درباره",
                      style: TextStyle(
                          color: onSurfaceHighEmphasis,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ]),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 32,
                      margin: EdgeInsets.only(bottom: 24),
                      child: Text(publisher.description,
                          style: TextStyle(
                              color: onSurfaceMediumEmphasis,
                              fontSize: 16,
                              fontWeight: FontWeight.normal)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Text(
                        "کتاب‌ها",
                        style: TextStyle(
                            color: onSurfaceHighEmphasis,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                showCategoryBooks(context, publisher),
              ]))),
      bottomNavigationBar: MyFloatingNavigationBar(),
    );
  }

  showHorizontalBookCard(Book book) {
    return Row(children: [
      Expanded(
        child: Container(
          margin: EdgeInsets.only(bottom: 8),
          child: HorizontalProductCard(
            book: book,
          ),
        ),
      ),
    ]);
  }

  showCategoryBooks(BuildContext context, Publisher publisher) {
    List<Widget> booksWidgets = [];
    return FutureBuilder(
      future: getBooks(limit: 0, publisherId: publisher.id), // async work
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
                booksWidgets.add(showHorizontalBookCard(book));
              });
              return Column(children: booksWidgets);
            }
        }
      },
    );
  }
}
