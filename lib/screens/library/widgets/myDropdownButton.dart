import 'package:ibr/ibr.dart';

class MyDropdownButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const MyDropdownButton(
      {Key key, this.backgroundColor, this.textColor, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          padding: EdgeInsets.fromLTRB(16, 13, 16, 13),
          width: 128,
          height: 48,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: onPrimaryHighEmphasis,
              border: Border.all(color: onSurfaceBorder, width: 1)),
          child: Text(text,
              style: TextStyle(
                  color: onSurfaceMediumEmphasis,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  height: 1.5))),
    );
  }
}
