import 'package:ibr/ibr.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key key,
  }) : super(key: key);
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 56,
        color: onPrimaryHighEmphasis,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('کتاب خوان',
                    style: TextStyle(
                        color: onSurfaceHighEmphasis,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                    child: Text('ورود به حساب',
                        style: TextStyle(
                            color: myTheme.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal)),
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    }),
              ],
            )
          ],
        ));
  }
}
