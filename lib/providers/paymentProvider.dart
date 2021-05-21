import 'package:ibr/ibr.dart';

class PaymentProvider extends ChangeNotifier {
  Map lastPayment;
  StreamSubscription _sub;
  PaymentRequest _paymentRequest;

  void handleIncomingPaymentLinks() {
    _sub = uriLinkStream.listen((Uri uri) {
      Map newPayment = uri.queryParametersAll;
      setLastPaymentInfromations(newPayment);
      print("Verifying payment...");
      verifyPayment();
      // print('got uri: $uri');
    }, onError: (Object err) {
      // print('got err: $err');
    });
  }

  void setLastPaymentInfromations(Map newPayment) {
    lastPayment = newPayment;
    notifyListeners();
  }

  PaymentRequest requestPayment(num finalPrice, String description) {
    PaymentRequest _paymentRequest = PaymentRequest()
      ..setIsSandBox(!isProduction)
      ..setMerchantID(merchantID)
      ..setAmount(finalPrice)
      ..setCallbackURL(callbackURL)
      ..setDescription(description);
    String _paymentUrl = null;
    ZarinPal().startPayment(_paymentRequest,
        (int status, String paymentGatewayUri) {
      if (status == 100) {
        _paymentUrl = paymentGatewayUri;
        launchURL(_paymentUrl);
      }
    });
    this._paymentRequest = _paymentRequest;
  }

  verifyPayment() {
    final String status = lastPayment["Status"][0] ?? "";
    final String authority = lastPayment["Authority"][0] ?? "";
    ZarinPal().verificationPayment(status, authority, _paymentRequest,
        (isPaymentSuccess, refID, paymentRequest) {
      if (isPaymentSuccess) {
        print("payment wa succesful!");
      } else {
        // Error Print Status
        print("Payment faild!");
      }
      setLastPaymentInfromations(null);
    });
  }
}
