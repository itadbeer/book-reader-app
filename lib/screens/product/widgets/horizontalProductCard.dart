import 'package:ibr/ibr.dart';

class HorizontalProductCard extends StatelessWidget {
  final String name;
  final int discountAmount;
  final String price;
  final String finalPrice;
  const HorizontalProductCard(
      {Key key, this.name, this.discountAmount, this.price, this.finalPrice})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 96,
      decoration: BoxDecoration(
        color: onPrimaryHighEmphasis,
        border: Border.all(color: onSurfaceBorder, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Column(children: [
            Container(
              margin: EdgeInsets.only(left: 16),
              child: GestureDetector(
                onTap: () => {Navigator.pushNamed(context, '/singleProduct')},
                child: CachedNetworkImage(
                  imageUrl:
                      'https://m.media-amazon.com/images/I/41gr3r3FSWL.jpg',
                  height: 92.11,
                  width: 72,
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
                    this.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ]),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 8),
                  width: 32,
                  height: 22,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                        color: myTheme.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: Center(
                      child: Text(
                        "${this.discountAmount}%",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Text(this.price,
                      style: TextStyle(
                          color: onSurfaceMediumEmphasis,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 14)),
                ),
                RichText(
                    text: TextSpan(
                        text: this.finalPrice,
                        style: TextStyle(
                            color: myTheme.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500))),
                Text(" تومان",
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
