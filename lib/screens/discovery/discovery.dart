import 'package:ibr/ibr.dart';
import 'package:ibr/screens/discovery/widgets/cardsSection.dart';
import 'package:ibr/screens/discovery/widgets/searchBar.dart';

class Discovery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: TopBar(
        title: "کتاب خوان",
        displayGoBackButton: false,
        displayActionButton: true,
        actionButtonText: 'ورود به حساب',
        actionButtonLink: '/login',
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                SearchBar(),
                CardsSection(title: "محبوب ترین ها"),
                CardsSection(title: "آخرین ها"),
                SizedBox(height: 88)
              ],
            )),
      ),
      bottomNavigationBar: MyFloatingNavigationBar(),
    );
  }
}
