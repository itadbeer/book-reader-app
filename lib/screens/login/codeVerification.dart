import 'package:ibr/api/codeVerification.dart';
import 'package:ibr/api/login.dart';
import 'package:ibr/ibr.dart';
import 'package:ibr/models/user.dart';

class CodeVerificationScreen extends StatelessWidget {
  final verificationCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserHandler>(context, listen: false).user;
    final codeVerification = CodeVerification(user);
    var timerProvider = TimerProvider(counter: 60);
    timerProvider.startTimer();
    return ChangeNotifierProvider<TimerProvider>(
      create: (context) => timerProvider,
      child: Scaffold(
          extendBody: true,
          appBar: TopBar(
              title: "تایید شمارۀ همراه",
              bgColor: onPrimaryHighEmphasis,
              displayGoBackButton: true,
              displayActionButton: false),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(16, 24, 16, 0),
              child: Column(children: [
                Row(children: <Widget>[
                  Container(
                    child: Text(
                      "لطفا کد ارسال‌شده به شمارۀ همراهتان را وارد کنید",
                      style: TextStyle(
                          color: onSurfaceMediumEmphasis, fontSize: 14),
                    ),
                  )
                ]),
                MyTextBox(
                  controller: verificationCodeController,
                  onChanged: (String code) async => {
                    if (verificationCodeController.text.length == 4)
                      {
                        if (await codeVerification.verifyCode(code))
                          {signInUser(context, user)}
                        else
                          {print('error')}
                      }
                  },
                  maxLength: 4,
                  keyboardType: TextInputType.number,
                  caption: "کد تایید",
                  placeholder: "- - - -",
                ),
                Row(
                  children: [
                    Consumer<TimerProvider>(
                        builder: (context, timerProvider, child) {
                      return Container(
                          margin: EdgeInsets.only(top: 24),
                          child: GestureDetector(
                            onTap: () async {
                              if (timerProvider.counter == 0) {
                                final mobile = Provider.of<UserHandler>(context,
                                        listen: false)
                                    .user
                                    .mobile;
                                var login = Login(mobile: mobile);
                                var result =
                                    await login.requestVerificationCode();
                                if (result) {
                                  Navigator.pushReplacementNamed(
                                      context, '/codeVerification');
                                }
                              }
                            },
                            child: Text(
                                timerProvider.counter > 0
                                    ? "ارسال دوباره (00:${timerProvider.counter}) دیگر"
                                    : "ارسال دوباره",
                                style: TextStyle(
                                    color: timerProvider.counter > 0
                                        ? onSurfaceDisabled
                                        : myTheme.primaryColor,
                                    fontSize: 16)),
                          ));
                    }),
                  ],
                )
              ]),
            ),
          )),
    );
  }

  signInUser(BuildContext context, User user) {
    GetStorage().write('mobile', user.mobile);
    Navigator.pushNamed(context, '/');
  }
}
