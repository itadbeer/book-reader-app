import 'package:ibr/ibr.dart';

class SingleProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: SimpleTopBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                child: Image.network(
                  'https://edrisranjbar.ir/wp-content/uploads/2021/04/book.png',
                  height: 288,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 24, bottom: 24),
                child: Text(
                  "ترجمه لغات و اصطلاحات کل سلسله العربیة بین یدیک",
                  style: TextStyle(
                      fontSize: 20,
                      color: onSurfaceHighEmphasis,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    width: 32,
                    height: 22.0,
                    color: Colors.transparent,
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
                      style: TextStyle(
                          color: onSurfaceMediumEmphasis, fontSize: 12))
                ],
              ),
              Row(children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 96,
                    height: 36,
                    margin: EdgeInsets.only(top: 16, bottom: 24),
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
              ]),
              Column(
                children: [
                  Row(
                    children: [
                      Text("نویسنده: ",
                          style: TextStyle(
                              color: onSurfaceMediumEmphasis, fontSize: 16)),
                      Text("نام نویسنده",
                          style: TextStyle(
                              color: myTheme.primaryColor, fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("مترجم: ",
                          style: TextStyle(
                              color: onSurfaceMediumEmphasis, fontSize: 16)),
                      Text("نام مترجم",
                          style: TextStyle(
                              color: myTheme.primaryColor, fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("ناشر: ",
                          style: TextStyle(
                              color: onSurfaceMediumEmphasis, fontSize: 16)),
                      Text("نام ناشر",
                          style: TextStyle(
                              color: myTheme.primaryColor, fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("سال نشر: ",
                          style: TextStyle(
                              color: onSurfaceMediumEmphasis, fontSize: 16)),
                      Text("1399",
                          style: TextStyle(
                              color: onSurfaceHighEmphasis, fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("تعداد صفحات: ",
                          style: TextStyle(
                              color: onSurfaceMediumEmphasis, fontSize: 16)),
                      Text("274",
                          style: TextStyle(
                              color: onSurfaceHighEmphasis, fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("دسته بندی ها: ",
                          style: TextStyle(
                              color: onSurfaceMediumEmphasis, fontSize: 16)),
                      Text("دسته بندی",
                          style: TextStyle(
                              color: myTheme.primaryColor, fontSize: 16)),
                      Text("، ",
                          style: TextStyle(
                              color: onSurfaceMediumEmphasis, fontSize: 16)),
                      Text("دسته بندی",
                          style: TextStyle(
                              color: myTheme.primaryColor, fontSize: 16)),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: EdgeInsets.only(top: 24, bottom: 16),
                      child: Text("توضیحات",
                          style: TextStyle(
                              color: onSurfaceHighEmphasis,
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 56),
                      child: Text(
                          "این یک متن مثلا طولانی دربارۀ این کتاب است به نظر متن زیبایی می‌آید امیدوارم از خواندن آن لذت ببرید من که قطعا نوشتنش را دوست دارم",
                          style: TextStyle(
                              color: onSurfaceMediumEmphasis, fontSize: 16)))
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FooterPurchaseBar(),
    );
  }
}

class SimpleTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color bgColor;
  const SimpleTopBar({Key key, this.title, this.bgColor});
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
              height: 56,
              color: bgColor ?? Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 22.23),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: IconButton(
                              padding: EdgeInsets.fromLTRB(0, 18, 22, 18),
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                      ],
                    ),
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(this.title ?? "",
                            style: TextStyle(
                                color: onSurfaceHighEmphasis,
                                fontSize: 20,
                                fontWeight: FontWeight.w500))
                      ])
                ],
              )),
        ),
      ],
    );
  }
}

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
            ]),
      ]),
    );
  }
}
