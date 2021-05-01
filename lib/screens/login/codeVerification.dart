import 'package:ibr/ibr.dart';

class CodeVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: SimpleTopBar(
            title: "تایید شمارۀ همراه",
            bgColor: onPrimaryHighEmphasis,
            displayGoBackButton: true),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(16, 24, 16, 0),
            child: Column(children: [
              Row(children: <Widget>[
                Container(
                  child: Text(
                    "لطفا کد ارسال‌شده به شمارۀ همراهتان را وارد کنید",
                    style:
                        TextStyle(color: onSurfaceMediumEmphasis, fontSize: 14),
                  ),
                )
              ]),
              MyTextBox(
                caption: "کد تایید",
                placeholder: "- - - -",
              ),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 24),
                      child: Text("ارسال دوباره (00:57)",
                          style: TextStyle(
                              color: onSurfaceDisabled, fontSize: 16))),
                ],
              )
            ]),
          ),
        ));
  }
}
