import 'package:ibr/ibr.dart';

class LoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: FittedBox(
        fit: BoxFit.contain,
        child: CircularProgressIndicator(
          strokeWidth: 1,
        ),
      ),
    );
  }
}
