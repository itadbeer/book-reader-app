import 'package:ibr/ibr.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: TopBar(
          title: "ورود به حساب کاربری",
          bgColor: onPrimaryHighEmphasis,
          displayGoBackButton: true,
          displayActionButton: false,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(16, 24, 16, 0),
            child: Column(children: [
              Row(children: <Widget>[
                Container(
                  child: Text(
                    "برای خرید و حفظ کتاب‌های خریداری‌شده در کتابخانه‌تان، وارد حساب کاربری شوید.",
                    style:
                        TextStyle(color: onSurfaceMediumEmphasis, fontSize: 14),
                  ),
                )
              ]),
              MyTextBox(caption: "شمارۀ همراه", placeholder: "09-- --- ----"),
              Container(
                  width: MediaQuery.of(context).size.width - 32,
                  height: 40,
                  margin: EdgeInsets.only(top: 24),
                  decoration: BoxDecoration(
                      color: onSurfaceBorder,
                      borderRadius: BorderRadius.circular(8)),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/codeVerification');
                      },
                      child: Container(
                          child: Center(
                              child: Text(
                        "ارسال کد تایید",
                        style: TextStyle(
                          color: onSurfaceDisabled,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ))))),
              Container(
                  margin: EdgeInsets.only(top: 24),
                  child: Text(
                      "درصورتی که حساب کاربری ندارید با واردکردن شمارۀ همراهتان و تایید کد ارسال شده از طریق پیامک به‌صورت خودکار حسابی برای شما ایجاد می‌شود.",
                      style: TextStyle(
                          color: onSurfaceMediumEmphasis, fontSize: 12)))
            ]),
          ),
        ));
  }
}

class MyTextBox extends StatelessWidget {
  final String caption;
  final String placeholder;
  const MyTextBox({Key key, this.caption, this.placeholder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textFieldHasFocus = false;
    return Column(
      children: [
        Row(
          children: [
            Container(
                margin: EdgeInsets.only(top: 24),
                child: Text(this.caption,
                    style: TextStyle(
                        color: textFieldHasFocus
                            ? myTheme.primaryColor
                            : onSurfaceMediumEmphasis,
                        fontSize: 16)))
          ],
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 8),
              width: MediaQuery.of(context).size.width - 32,
              child: Focus(
                onFocusChange: (hasFocus) {
                  textFieldHasFocus = hasFocus;
                },
                child: TextField(
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(right: 24, left: 24),
                    filled: true,
                    fillColor: Color.fromRGBO(0, 0, 0, 0.04),
                    labelStyle:
                        TextStyle(color: onSurfaceHighEmphasis, fontSize: 16),
                    hintStyle:
                        TextStyle(color: onSurfaceDisabled, fontSize: 16),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(16)),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: primaryLightVariant),
                        borderRadius: BorderRadius.circular(16)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(16)),
                    hintText: this.placeholder ?? "",
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
