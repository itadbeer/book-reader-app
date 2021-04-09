import 'package:ibr/ibr.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key key,
  }) : super(key: key);
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text('کتاب خوان',
          style: TextStyle(color: onSurfaceHighEmphasis, fontSize: 20)),
      actions: [
        TextButton(
            child: Text('ورود به حساب',
                style: TextStyle(color: myTheme.primaryColor, fontSize: 16)),
            onPressed: () {})
      ],
    );
  }
}
