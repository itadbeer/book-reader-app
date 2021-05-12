import 'package:ibr/ibr.dart';
import 'package:ibr/screens/discovery/widgets/cardsSection.dart';
import 'package:ibr/screens/discovery/widgets/searchBar.dart';

class Discovery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mobile = GetStorage().read('mobile');
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
                GestureDetector(
                  child: SearchBar(
                    enabled: false,
                  ),
                  onTap: () {
                    showSearch(
                        context: context,
                        delegate: CustomSearchDelegate(hintText: "جست‌وجو"),
                        query: "متن تستی");
                  },
                ),
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
