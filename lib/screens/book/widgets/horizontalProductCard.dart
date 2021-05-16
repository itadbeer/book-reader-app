import 'package:ibr/ibr.dart';
import 'package:ibr/models/book.dart';
import 'package:intl/intl.dart';

class HorizontalProductCard extends StatelessWidget {
  final Book book;
  const HorizontalProductCard({Key key, this.book}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var money =
        NumberFormat.currency(locale: "en_US", symbol: "", decimalDigits: 0);
    final int finalPrice =
        ((book.price / 100) * (100 - book.discountPercentage)) as int;
    return Container(
      padding: EdgeInsets.only(left: 16),
      height: 96,
      width: 358,
      decoration: BoxDecoration(
        color: onPrimaryHighEmphasis,
        border: Border.all(color: onSurfaceBorder, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Column(children: [
            Container(
              padding: EdgeInsets.all(8),
              width: 72,
              height: 92.11,
              child: GestureDetector(
                onTap: () => {Navigator.pushNamed(context, '/singleProduct')},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: book.image,
                  ),
                ),
              ),
            ),
          ]),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Container(
                margin: EdgeInsets.only(top: 16, bottom: 20),
                child: GestureDetector(
                  onTap: () => {Navigator.pushNamed(context, '/singleProduct')},
                  child: Text(
                    book.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        height: 1.5),
                  ),
                ),
              ),
            ]),
            Row(
              children: <Widget>[
                book.discountPercentage > 0
                    ? Container(
                        margin: EdgeInsets.only(left: 8),
                        width: 32,
                        height: 22,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              color: myTheme.primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: Center(
                            child: Text(
                              "${book.discountPercentage}%",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )
                    : Container(),
                book.discountPercentage > 0
                    ? Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Text(money.format(book.price),
                            style: TextStyle(
                                color: onSurfaceMediumEmphasis,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 14)),
                      )
                    : Container(),
                RichText(
                    text: TextSpan(
                        text: finalPrice > 0
                            ? money.format(finalPrice)
                            : "رایگان",
                        style: TextStyle(
                            color: myTheme.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500))),
                Text(finalPrice > 0 ? " تومان" : "",
                    style:
                        TextStyle(color: onSurfaceMediumEmphasis, fontSize: 12))
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
