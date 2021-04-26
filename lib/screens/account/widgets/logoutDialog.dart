import 'package:ibr/ibr.dart';

class LogoutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyDialog(
      title: "آیا می‌خواهید خارج شوید؟",
      content: [
        Container(
          height: 52,
          margin: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 24),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text("بمان",
                            style: TextStyle(
                                color: myTheme.primaryColor, fontSize: 14)),
                      ))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "خروج",
                      style: TextStyle(color: error, fontSize: 14),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
