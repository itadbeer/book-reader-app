import 'package:ibr/ibr.dart';
import 'package:ibr/screens/product/widgets/horizontalProductCard.dart';

class PublisherWriterTranslator extends StatelessWidget {
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
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Text(
                      "درباره",
                      style: TextStyle(
                          color: onSurfaceHighEmphasis,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ]),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 16,
                      margin: EdgeInsets.only(bottom: 24),
                      child: Text(
                          "این یک متن مثلا طولانی دربارۀ این کتاب است به نظر متن زیبایی می‌آید امیدوارم از خواندن آن لذت ببرید من که قطعا نوشتنش را دوست دارم",
                          style: TextStyle(
                              color: onSurfaceMediumEmphasis,
                              fontSize: 16,
                              fontWeight: FontWeight.normal)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Text(
                        "کتاب‌ها",
                        style: TextStyle(
                            color: onSurfaceHighEmphasis,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                Row(children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: HorizontalProductCard(
                        name: "ترجمه لغات و اصطلاحات کل سلسله العربی",
                        discountAmount: 75,
                        price: 45000,
                        finalPrice: 11250,
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
                        price: 45000,
                        finalPrice: 11250,
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
                        price: 45000,
                        finalPrice: 11250,
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
