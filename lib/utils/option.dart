import 'package:ibr/ibr.dart';

class Option extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry padding;
  final double height;
  const Option({Key key, this.children, this.padding, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height ?? 56,
      padding: this.padding ?? EdgeInsets.all(0),
      child: Row(
        children: this.children,
      ),
    );
  }
}
