import 'package:ibr/ibr.dart';

class MyDialog extends StatelessWidget {
  final String title;
  final List<Widget> content;
  const MyDialog({Key key, this.title, this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    this.content.insert(
        0,
        Row(
          children: [
            Text(
              this.title,
              style: TextStyle(color: onSurfaceMediumEmphasis, fontSize: 14),
            )
          ],
        ));
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 280,
        height: 118,
        padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: Wrap(children: [
          Column(
            children: this.content,
          ),
        ]),
      ),
    );
  }
}
