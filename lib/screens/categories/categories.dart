import 'package:ibr/ibr.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: TopBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Container(
                        height: 56,
                        child: Text("دسته‌بندی‌",
                            style: TextStyle(
                                color: onSurfaceMediumEmphasis, fontSize: 16)))
                  ],
                ),
                Row(
                  children: [
                    Container(
                        height: 56,
                        child: Text("دسته‌بندی‌",
                            style: TextStyle(
                                color: onSurfaceMediumEmphasis, fontSize: 16)))
                  ],
                ),
                Row(
                  children: [
                    Container(
                        height: 56,
                        child: Text("دسته‌بندی‌",
                            style: TextStyle(
                                color: onSurfaceMediumEmphasis, fontSize: 16)))
                  ],
                ),
              ],
            )),
      ),
      bottomNavigationBar: MyFloatingNavigationBar(),
    );
  }
}

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({
    Key key,
  }) : super(key: key);
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
          height: 56,
          child: GestureDetector(
              child: Text("دسته‌بندی‌ها",
                  style: TextStyle(
                      color: onSurfaceHighEmphasis,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)))),
    );
  }
}
