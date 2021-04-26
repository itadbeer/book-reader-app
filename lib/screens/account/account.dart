import 'package:ibr/ibr.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: SimpleTopBar(
            title: "تایید شمارۀ همراه", bgColor: onPrimaryHighEmphasis),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(16, 24, 16, 0),
                child: Column(children: [
                  Row(
                    children: [
                      Option(
                        padding: EdgeInsets.all(16),
                        children: [
                          Text("0930 622 2326",
                              style: TextStyle(
                                  color: onSurfaceMediumEmphasis, fontSize: 16))
                        ],
                      ),
                      Option(
                        padding: EdgeInsets.all(16),
                        children: [
                          Text("خروج از حساب",
                              style: TextStyle(color: error, fontSize: 16))
                        ],
                      )
                    ],
                  )
                ]))));
  }
}

class Option extends StatelessWidget {
  final List children;
  final EdgeInsetsGeometry padding;
  const Option({Key key, this.children, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: this.padding ?? EdgeInsets.all(0),
      child: Row(
        children: this.children,
      ),
    );
  }
}
