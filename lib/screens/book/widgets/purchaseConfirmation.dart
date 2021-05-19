import 'package:ibr/ibr.dart';
import 'package:ibr/models/book.dart';
import 'package:intl/intl.dart';

class PurchaseConfirmationDialog extends StatelessWidget {
  final Book book;
  const PurchaseConfirmationDialog({Key key, this.book}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var money =
        NumberFormat.currency(locale: "en_US", symbol: "", decimalDigits: 0);
    final double finalPrice =
        (book.price / 100) * (100 - book.discountPercentage);
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
            color: onPrimaryHighEmphasis,
            borderRadius: BorderRadius.circular(16)),
        width: 280,
        height: 290,
        padding: EdgeInsets.fromLTRB(24, 24, 24, 8),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Text("برای خرید این کتاب به درگاه پرداخت منتقل شوید؟",
                      style: TextStyle(
                          color: onSurfaceMediumEmphasis,
                          fontSize: 14,
                          height: 1.5)),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 36,
                    margin: EdgeInsets.only(left: 8, bottom: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: CachedNetworkImage(
                        imageUrl: book.image,
                        width: 36,
                        height: 48,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Text(
                        book.name,
                        style: TextStyle(
                            color: onSurfaceMediumEmphasis,
                            fontSize: 12,
                            height: 1.5),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 4, bottom: 24),
                child: Text(
                  "مبلغ قابل پرداخت:",
                  style: TextStyle(
                      color: onSurfaceMediumEmphasis,
                      fontSize: 14,
                      height: 1.5),
                ),
              ),
              Container(
                child: Text(money.format(finalPrice),
                    style: TextStyle(
                        color: myTheme.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.6)),
              ),
              Container(
                child: Text(" تومان",
                    style: TextStyle(
                        color: onSurfaceMediumEmphasis,
                        fontSize: 12,
                        height: 1.5)),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Button(
                          onPressed: () {
                            pay(finalPrice, "خرید کتاب ${book.name}");
                          },
                          textAlign: TextAlign.center,
                          padding: EdgeInsets.all(0),
                          text: "انتقال به درگاه پرداخت",
                          height: 40,
                          width: double.infinity)))
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Button(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  textAlign: TextAlign.center,
                  padding: EdgeInsets.all(0),
                  text: "انصراف",
                  backgroundColor: onPrimaryHighEmphasis,
                  textColor: myTheme.primaryColor,
                  height: 40,
                  width: double.infinity,
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}

void pay(num finalPrice, String description) {
// Initialize payment request
  PaymentRequest _paymentRequest = PaymentRequest()
    ..setIsSandBox(!isProduction)
    ..setMerchantID(merchantID)
    ..setAmount(finalPrice)
    ..setCallbackURL(
        callbackURL) //The callback can be an android scheme or a website URL, you and can pass any data with The callback for both scheme and  URL
    ..setDescription(description);
// For scheme you can use uni_links dart Package
  String _paymentUrl = null;
// Call Start payment
  ZarinPal().startPayment(_paymentRequest,
      (int status, String paymentGatewayUri) {
    if (status == 100) {
      _paymentUrl = paymentGatewayUri;
      launchURL(_paymentUrl);
    }
  });

// Vefrication Payment
// if you set the scheme in your application, You can get the Status and Authority from scheme callback
// if your callback is a website URL like htt://mydomain.com you don't need verificationPayment function

  ZarinPal()
      .verificationPayment("Status", "Authority Call back", _paymentRequest,
          (isPaymentSuccess, refID, paymentRequest) {
    if (isPaymentSuccess) {
      // Payment Is Success
    } else {
      // Error Print Status
    }
  });
}
