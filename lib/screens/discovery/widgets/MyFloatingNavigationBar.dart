import 'package:ibr/ibr.dart';

class MyFloatingNavigationBar extends StatelessWidget {
  const MyFloatingNavigationBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: onSurface, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            child: BottomNavigationBar(
              currentIndex: 0,
              elevation: 0,
              backgroundColor: surface,
              selectedItemColor: myTheme.primaryColor,
              unselectedItemColor: onSurface,
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
            )));
  }
}
