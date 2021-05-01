import 'package:ibr/ibr.dart';
import 'package:ibr/screens/account/widgets/logoutDialog.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: TopBar(
            title: "حساب کاربری",
            bgColor: onPrimaryHighEmphasis,
            displayGoBackButton: true,
            displayActionButton: false),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(children: [
                  Row(children: [
                    Option(
                      padding: EdgeInsets.all(16),
                      children: [
                        Text("0930 622 2326",
                            style: TextStyle(
                                color: onSurfaceMediumEmphasis, fontSize: 16))
                      ],
                    ),
                  ]),
                  Row(
                    children: [
                      Option(
                        padding: EdgeInsets.all(16),
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      LogoutDialog());
                            },
                            child: Text("خروج از حساب",
                                style: TextStyle(color: error, fontSize: 16)),
                          )
                        ],
                      )
                    ],
                  )
                ]))));
  }
}
