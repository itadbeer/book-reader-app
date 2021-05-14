import 'package:ibr/ibr.dart';
import 'package:ibr/screens/product/widgets/purchaseConfirmation.dart';

class FooterPurchaseBar extends StatelessWidget {
  const FooterPurchaseBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      height: 56,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: onPrimaryHighEmphasis,
        border: Border(top: BorderSide(color: onSurfaceBorder, width: 1)),
      ),
      child: Row(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 8),
                  width: 32,
                  height: 22.0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: myTheme.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: Center(
                      child: Text(
                        "75%",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 8, left: 8),
                  child: Text("45,000",
                      style: TextStyle(
                          color: onSurfaceMediumEmphasis,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 14)),
                ),
                RichText(
                    text: TextSpan(
                        text: "11,250",
                        style: TextStyle(
                            color: myTheme.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500))),
                Text(" تومان",
                    style:
                        TextStyle(color: onSurfaceMediumEmphasis, fontSize: 12))
              ],
            )
          ],
        ),
        Spacer(),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    if (isLoggedIn()) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              PurchaseConfirmationDialog());
                    } else {
                      Navigator.pushNamed(context, '/login');
                    }
                  },
                  child: Container(
                    width: 96,
                    height: 36,
                    decoration: BoxDecoration(
                        color: myTheme.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: Center(
                      child: Text(
                        "خرید",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
      ]),
    );
  }
}
