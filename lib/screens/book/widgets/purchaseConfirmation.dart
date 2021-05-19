import 'package:ibr/ibr.dart';

class PurchaseConfirmationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8, bottom: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://imgcdn.taaghche.com/frontCover/38729.jpg',
                          width: 36,
                          height: 48,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 16),
                          child: Text(
                            "ترجمه لغات و اصطلاحات کل سلسله العربیة بین یدیک",
                            style: TextStyle(
                                color: onSurfaceMediumEmphasis,
                                fontSize: 12,
                                height: 1.5),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
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
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Button(
                          onPressed: () {
                            // showDialog(
                            //     context: context,
                            //     barrierDismissible: false,
                            //     builder: (BuildContext context) =>
                            //         LoadingDialog());
                            pay();
                          },
                          textAlign: TextAlign.center,
                          padding: EdgeInsets.symmetric(vertical: 8),
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
                  padding: EdgeInsets.symmetric(vertical: 8),
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

void pay() {
// Initialize payment request
  PaymentRequest _paymentRequest = PaymentRequest()
    ..setIsSandBox(true)
    ..setMerchantID("32aaa4d0-a667-11e9-98b0-000c29344814")
    ..setAmount(1000)
    ..setCallbackURL(
        "https://edrisranjbar.ir") //The callback can be an android scheme or a website URL, you and can pass any data with The callback for both scheme and  URL
    ..setDescription("Payment Description");
// For scheme you can use uni_links dart Package

  String _paymentUrl = null;
// Call Start payment
  ZarinPal().startPayment(_paymentRequest,
      (int status, String paymentGatewayUri) {
    if (status == 100) _paymentUrl = paymentGatewayUri; // launch URL in browser
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
