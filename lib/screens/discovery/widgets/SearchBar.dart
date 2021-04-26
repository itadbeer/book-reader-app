import 'package:ibr/ibr.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _searchController = TextEditingController();
    return Container(
        width: MediaQuery.of(context).size.width - 32,
        child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(0, 0, 0, 0.04),
              labelStyle: TextStyle(color: onSurfaceHighEmphasis, fontSize: 16),
              hintStyle: TextStyle(color: onSurfaceDisabled, fontSize: 16),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16)),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16)),
              hintText: 'جست و جو',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 27, left: 19),
                child: Icon(
                  Icons.search,
                  color: onSurfaceDisabled,
                ),
              ),
              prefixIconConstraints:
                  BoxConstraints(minHeight: 24, minWidth: 24),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(21),
                child: IconButton(
                  onPressed: () => _searchController.clear(),
                  icon: Icon(
                    Icons.clear,
                    color: onSurfaceMediumEmphasis,
                  ),
                ),
              ),
            )));
  }
}
