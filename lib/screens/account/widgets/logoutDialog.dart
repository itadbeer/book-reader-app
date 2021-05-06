import 'package:ibr/ibr.dart';

class LogoutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 280,
        height: 118,
        padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: Column(children: [
          Row(
            children: [
              Text(
                "آیا می‌خواهید خارج شوید؟",
                style: TextStyle(color: onSurfaceMediumEmphasis, fontSize: 14),
              )
            ],
          ),
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
          ),
        ]),
      ),
    );
  }
}
