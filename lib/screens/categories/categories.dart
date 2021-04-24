import 'package:ibr/ibr.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[Text("hello world")],
            )),
      ),
      bottomNavigationBar: MyFloatingNavigationBar(),
    );
  }
}
