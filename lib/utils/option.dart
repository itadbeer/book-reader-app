import 'package:ibr/ibr.dart';

class Option extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry padding;
  const Option({Key key, this.children, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: this.padding ?? EdgeInsets.all(0),
      child: Row(
        children: this.children,
      ),
    );
  }
}
