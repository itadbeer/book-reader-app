import 'package:ibr/ibr.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              children: <Widget>[
                Row(
                  children: [
                    Option(children: <Widget>[
                      Text("دسته‌بندی‌",
                          style: TextStyle(
                              color: onSurfaceMediumEmphasis, fontSize: 16))
                    ])
                  ],
                ),
                Row(
                  children: [
                    Option(children: <Widget>[
                      Text("دسته‌بندی‌",
                          style: TextStyle(
                              color: onSurfaceMediumEmphasis, fontSize: 16))
                    ])
                  ],
                ),
                Row(
                  children: [
                    Option(children: <Widget>[
                      Text("دسته‌بندی‌",
                          style: TextStyle(
                              color: onSurfaceMediumEmphasis, fontSize: 16))
                    ])
                  ],
                ),
              ],
            )),
      ),
      bottomNavigationBar: MyFloatingNavigationBar(),
    );
  }
}
