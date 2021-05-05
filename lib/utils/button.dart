import 'package:ibr/ibr.dart';

class Button extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final EdgeInsets padding;
  final Function onPressed;

  const Button(
      {Key key,
      @required this.text,
      this.backgroundColor,
      this.textColor,
      this.padding,
      this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent)),
      onPressed: onPressed,
      child: Container(
        padding: this.padding ?? EdgeInsets.fromLTRB(16, 7, 16, 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: backgroundColor ?? myTheme.primaryColor,
        ),
        child: Text(this.text,
            style: TextStyle(
                color: this.textColor ?? onPrimaryHighEmphasis,
                fontSize: 14,
                fontWeight: FontWeight.normal)),
      ),
    );
  }
}
