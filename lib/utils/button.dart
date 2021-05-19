import 'package:ibr/ibr.dart';

class Button extends StatelessWidget {
  final double width;
  final double height;
  final TextAlign textAlign;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final EdgeInsets padding;
  final Function onPressed;

  const Button(
      {Key key,
      this.width,
      this.height,
      @required this.text,
      this.backgroundColor,
      this.textColor,
      this.padding,
      this.onPressed,
      this.textAlign})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      padding: this.padding ?? EdgeInsets.fromLTRB(16, 7, 16, 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: backgroundColor ?? myTheme.primaryColor,
      ),
      child: TextButton(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent)),
        onPressed: onPressed,
        child: Text(
          this.text,
          textAlign: this.textAlign,
          style: TextStyle(
              color: this.textColor ?? onPrimaryHighEmphasis,
              fontSize: 14,
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
