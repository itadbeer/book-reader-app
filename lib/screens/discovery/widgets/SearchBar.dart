import 'package:ibr/ibr.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(27, 19, 27, 19),
          filled: true,
          fillColor: Color.fromRGBO(0, 0, 0, 0.04),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16)),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16)),
          hintText: 'جست و جو',
          prefixIcon: Icon(
            Icons.search,
            color: Color.fromRGBO(0, 0, 0, 0.4),
          )),
    ));
  }
}
