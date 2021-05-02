import 'package:ibr/ibr.dart';

Container buildProductCard(BuildContext context) {
  return Container(
    width: 150,
    margin: EdgeInsets.only(left: 8, top: 16),
    child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.12), width: 1),
          ),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () => {Navigator.pushNamed(context, '/singleProduct')},
                child: CachedNetworkImage(
                  imageUrl: 'https://imgcdn.taaghche.com/frontCover/38729.jpg',
                  height: 200,
                  width: 150,
                ),
              ),
              GestureDetector(
                onTap: () => {Navigator.pushNamed(context, '/singleProduct')},
                child: Text("ترجمه لغات و اصطلاحات کل سلسله العربیة بین یدیک",
                    style: TextStyle(fontSize: 14, color: Colors.black)),
              ),
              Container(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  children: [
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          width: 32,
                          height: 22.0,
                          color: Colors.transparent,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: myTheme.primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                              child: new Center(
                                child: new Text(
                                  "75%",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("45,000",
                                style: TextStyle(
                                    color: onSurfaceMediumEmphasis,
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 14))
                          ],
                        ),
                        Row(
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: "11,250",
                                    style: TextStyle(
                                        color: myTheme.primaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))),
                            Text(" تومان",
                                style: TextStyle(
                                    color: onSurfaceMediumEmphasis,
                                    fontSize: 12))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

class CardsSection extends StatelessWidget {
  final String title;
  const CardsSection({Key key, this.title});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CardsSectionHeader(title: title),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            buildProductCard(context),
            buildProductCard(context),
            buildProductCard(context)
          ],
        ),
      )
    ]);
  }
}

class CardsSectionHeader extends StatelessWidget {
  final String title;
  const CardsSectionHeader({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
      margin: EdgeInsets.only(top: 24),
      child: Row(
        children: <Widget>[
          Text(title,
              style: TextStyle(
                  color: onSurfaceHighEmphasis,
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
          Spacer(),
          Text('نمایش بیشتر',
              style: TextStyle(color: myTheme.primaryColor, fontSize: 14)),
          Icon(Icons.chevron_right, color: myTheme.primaryColor)
        ],
      ),
    );
  }
}
