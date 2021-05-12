import 'package:ibr/api/login.dart';
import 'package:ibr/ibr.dart';

class LoginScreen extends StatelessWidget {
  var mobileTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(isLoggedIn());
    final buttonProvider = Provider.of<ButtonProvider>(context);
    return Scaffold(
        extendBody: true,
        appBar: TopBar(
          title: "ورود به حساب کاربری",
          bgColor: onPrimaryHighEmphasis,
          displayGoBackButton: true,
          displayActionButton: false,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(16, 24, 16, 0),
            child: Column(children: [
              Row(children: <Widget>[
                Container(
                  child: Text(
                    "برای خرید و حفظ کتاب‌های خریداری‌شده در کتابخانه‌تان، وارد حساب کاربری شوید.",
                    style:
                        TextStyle(color: onSurfaceMediumEmphasis, fontSize: 14),
                  ),
                )
              ]),
              MyTextBox(
                  keyboardType: TextInputType.phone,
                  controller: mobileTextController,
                  onChanged: (String text) => {
                        // todo: validate mobile number
                        if (!isAValidMobileNumber(mobileTextController.text))
                          {buttonProvider.setSate(ButtonState.disabled)}
                        else
                          {buttonProvider.setSate(ButtonState.active)}
                      },
                  caption: "شمارۀ همراه",
                  placeholder: "09-- --- ----"),
              Container(
                  width: MediaQuery.of(context).size.width - 32,
                  height: 40,
                  margin: EdgeInsets.only(top: 24),
                  decoration: BoxDecoration(
                      color: onSurfaceBorder,
                      borderRadius: BorderRadius.circular(8)),
                  child:
                      SubmitButton(mobileTextController: mobileTextController)),
              Container(
                  margin: EdgeInsets.only(top: 24),
                  child: Text(
                      "درصورتی که حساب کاربری ندارید با واردکردن شمارۀ همراهتان و تایید کد ارسال شده از طریق پیامک به‌صورت خودکار حسابی برای شما ایجاد می‌شود.",
                      style: TextStyle(
                          color: onSurfaceMediumEmphasis, fontSize: 12)))
            ]),
          ),
        ));
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key key,
    @required this.mobileTextController,
  }) : super(key: key);

  final TextEditingController mobileTextController;

  @override
  Widget build(BuildContext context) {
    final buttonProvider = Provider.of<ButtonProvider>(context);
    return TextButton(
        onPressed: buttonProvider.state == ButtonState.disabled
            ? null
            : () async {
                Provider.of<UserHandler>(context, listen: false)
                    .updateMobile(mobileTextController.text);
                var login = Login(mobile: mobileTextController.text);
                var result = await login.requestVerificationCode();
                if (result) {
                  Navigator.pushNamed(context, '/codeVerification');
                }
              },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: buttonProvider.state == ButtonState.normal
                  ? myTheme.primaryColor
                  : buttonProvider.state == ButtonState.active
                      ? myTheme.primaryColorDark
                      : onSurfaceBorder,
            ),
            child: Center(
                child: Text(
              "ارسال کد تایید",
              style: TextStyle(
                color: buttonProvider.state == ButtonState.normal ||
                        buttonProvider.state == ButtonState.active
                    ? onPrimaryHighEmphasis
                    : onSurfaceDisabled,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ))));
  }
}
