import 'package:ibr/ibr.dart';
import 'package:ibr/models/category.dart';
import 'package:ibr/screens/discovery/widgets/booksRow.dart';
import 'package:ibr/screens/discovery/widgets/searchBar.dart';

class Discovery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mobile = GetStorage().read('mobile');
    List<Category> categories = Provider.of<List<Category>>(context);
    return Scaffold(
      extendBody: true,
      appBar: TopBar(
        title: "کتاب خوان",
        displayGoBackButton: false,
        displayActionButton: true,
        actionButtonText: !isLoggedIn() ? 'ورود به حساب' : mobile,
        actionButtonLink: !isLoggedIn() ? '/login' : '/account',
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                showSearchBar(context),
                BooksRow(title: "آخرین ها"),
                ...showCategoryRows(categories),
                SizedBox(height: 88)
              ],
            )),
      ),
      bottomNavigationBar: MyFloatingNavigationBar(),
    );
  }

  GestureDetector showSearchBar(BuildContext context) {
    return GestureDetector(
      child: SearchBar(
        enabled: false,
      ),
      onTap: () {
        showSearch(
            context: context,
            delegate: CustomSearchDelegate(hintText: "جست‌وجو"),
            query: "متن تستی");
      },
    );
  }

  List<Widget> showCategoryRows(List<Category> categories) {
    List<Widget> rows = [];
    categories.forEach((category) async {
      rows.add(BooksRow(title: category.name, categoryId: category.id));
    });
    return rows;
  }
}
