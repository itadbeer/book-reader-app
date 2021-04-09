import 'package:ibr/ibr.dart';

class MyFloatingNavigationBar extends StatelessWidget {
  const MyFloatingNavigationBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: surface,
      selectedItemColor: myTheme.primaryColor,
      unselectedItemColor: onSurface,
      unselectedLabelStyle: TextStyle(color: onSurface),
      selectedFontSize: 12,
      unselectedFontSize: 12,
      onTap: (value) {
        // Respond to item press.
      },
      items: [
        BottomNavigationBarItem(
          label: 'کاوش',
          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          label: 'دسته‌بندی‌ها',
          icon: Icon(Icons.music_note),
        ),
        BottomNavigationBarItem(
          label: 'کتابخانۀ من',
          icon: Icon(Icons.location_on),
        ),
      ],
    );
  }
}
