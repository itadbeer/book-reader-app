import 'package:ibr/ibr.dart';
import 'package:ibr/models/book.dart';
import 'package:ibr/screens/book/widgets/horizontalProductCard.dart';

class BooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var books = Provider.of<BookProvider>(context).getAllBooks();
    return Scaffold(
      extendBody: true,
      appBar: TopBar(
          title: "همه کتاب ها",
          displayGoBackButton: true,
          displayActionButton: false),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(children: <Widget>[
                FutureBuilder(
                    future: books,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Book>> snapshot) {
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
                            return Container(
                              height:
                                  MediaQuery.of(context).size.height - 88 - 77,
                              child: ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return showHorizontalBookCard(
                                        snapshot.data[index]);
                                  }),
                            );
                          }
                      }
                    })
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
}
