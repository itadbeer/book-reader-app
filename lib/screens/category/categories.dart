import 'package:ibr/ibr.dart';
import 'package:ibr/models/category.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Category> categories = Provider.of<List<Category>>(context);
    return Scaffold(
      extendBody: true,
      appBar: TopBar(
          title: "دسته‌بندی‌ها",
          displayGoBackButton: false,
          displayActionButton: false),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: showAllCategories(context, categories),
            )),
      ),
      bottomNavigationBar: MyFloatingNavigationBar(),
    );
  }

  List showAllCategories(BuildContext context, List<Category> categories) {
    List<Widget> categoriesWidgets = [];
    categories.forEach((category) {
      categoriesWidgets.add(CategoryCard(category: category));
    });
    return categoriesWidgets;
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({
    Key key,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/category', arguments: category);
          },
          child: Option(children: <Widget>[
            Text(category.name,
                style: TextStyle(color: onSurfaceMediumEmphasis, fontSize: 16))
          ]),
        )
      ],
    );
  }
}
