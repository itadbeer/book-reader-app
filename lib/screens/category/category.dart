import 'package:ibr/ibr.dart';
import 'package:ibr/screens/product/widgets/horizontalProductCard.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: TopBar(
          title: "نام دسته",
          displayGoBackButton: true,
          displayActionButton: false),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(children: <Widget>[
                Row(children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: HorizontalProductCard(
                        name: "ترجمه لغات و اصطلاحات کل سلسله العربی",
                        discountAmount: 75,
                        price: "45,000",
                        finalPrice: "11,250",
                        thumbnailUrl:
                            "https://imgcdn.taaghche.com/frontCover/38729.jpg",
                      ),
                    ),
                  ),
                ]),
                Row(children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: HorizontalProductCard(
                        name: "ترجمه لغات و اصطلاحات کل سلسله العربی",
                        discountAmount: 75,
                        price: "45,000",
                        finalPrice: "11,250",
                        thumbnailUrl:
                            "https://imgcdn.taaghche.com/frontCover/38729.jpg",
                      ),
                    ),
                  ),
                ]),
                Row(children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: HorizontalProductCard(
                        name: "ترجمه لغات و اصطلاحات کل سلسله العربی",
                        discountAmount: 75,
                        price: "45,000",
                        finalPrice: "11,250",
                        thumbnailUrl:
                            "https://imgcdn.taaghche.com/frontCover/38729.jpg",
                      ),
                    ),
                  ),
                ]),
              ]))),
      bottomNavigationBar: MyFloatingNavigationBar(),
    );
  }
}