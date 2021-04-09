import 'package:ibr/ibr.dart';
import 'package:ibr/screens/discovery/widgets/MyAppBar.dart';
import 'package:ibr/screens/discovery/widgets/CardsSection.dart';
import 'package:ibr/screens/discovery/widgets/MyFloatingNavigationBar.dart';
import 'package:ibr/screens/discovery/widgets/SearchBar.dart';

class Discovery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                SearchBar(),
                CardsSection(title: "محبوب ترین ها"),
                CardsSection(title: "آخرین ها"),
                MyFloatingNavigationBar()
              ],
            )),
      ),
    );
  }
}
