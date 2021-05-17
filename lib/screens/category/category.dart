import 'package:ibr/ibr.dart';
import 'package:ibr/models/book.dart';
import 'package:ibr/models/category.dart';
import 'package:ibr/screens/book/widgets/horizontalProductCard.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Category category = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      extendBody: true,
      appBar: TopBar(
          title: category.name,
          displayGoBackButton: true,
          displayActionButton: false),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(children: <Widget>[
                showCategoryBooks(context, category),
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

  showCategoryBooks(BuildContext context, Category category) {
    List<Widget> booksWidgets = [];
    return FutureBuilder(
      future: getBooks(limit: 0, categoryId: category.id), // async work
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
