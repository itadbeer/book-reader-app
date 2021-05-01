import 'package:ibr/ibr.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: TopBar(
          title: "نام دسته",
          displayGoBackButton: true,
          displayActionButton: false),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(children: <Widget>[
                Row(children: []),
              ]))),
      bottomNavigationBar: MyFloatingNavigationBar(),
    );
  }
}
