import 'package:ibr/ibr.dart';

int currentIndex = 0;

class MyFloatingNavigationBar extends StatelessWidget {
  const MyFloatingNavigationBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: onSurfaceBorder, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: currentIndex,
          backgroundColor: onPrimaryHighEmphasis,
          selectedItemColor: myTheme.primaryColor,
          unselectedItemColor: onSurface,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedLabelStyle: TextStyle(height: 1.5),
          unselectedLabelStyle: TextStyle(height: 1.5),
          onTap: (newIndex) {
            currentIndex = newIndex;
            switch (currentIndex) {
              case 0:
                Navigator.pushReplacementNamed(context, '/');
                break;
              case 1:
                Navigator.pushReplacementNamed(context, '/categories');
                break;
              default:
                if (isLoggedIn()) {
                  Navigator.pushReplacementNamed(context, '/library');
                } else {
                  Navigator.pushNamed(context, '/login');
                }
            }
          },
          items: [
            BottomNavigationBarItem(
              label: 'کاوش',
              icon: Icon(Icons.favorite, size: 24),
            ),
            BottomNavigationBarItem(
              label: 'دسته‌بندی‌ها',
              icon: Icon(Icons.music_note, size: 24),
            ),
            BottomNavigationBarItem(
              label: 'کتابخانۀ من',
              icon: Icon(Icons.location_on, size: 24),
            ),
          ],
        ),
      ),
    );
  }
}
