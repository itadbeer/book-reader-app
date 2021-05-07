import 'package:ibr/ibr.dart';

class LoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: FittedBox(
        child: Container(
          height: 250,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
