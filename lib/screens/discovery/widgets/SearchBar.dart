import 'package:ibr/ibr.dart';

class SearchBar extends StatefulWidget {
  final Function onSubmitted;
  final double height;
  final double width;
  final bool enabled;

  const SearchBar({
    Key key,
    this.height,
    this.width,
    this.enabled,
    this.onSubmitted,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool _showClearButton = false;
  var _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _showClearButton = _searchController.text.length > 0;
      });
    });
  }

  Widget _getClearButton() {
    if (!_showClearButton) {
      return null;
    }
    return IconButton(
      onPressed: () => _searchController.clear(),
      icon: Icon(Icons.clear),
      color: onSurfaceMediumEmphasis,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width ?? MediaQuery.of(context).size.width - 32,
        height: widget.height ?? 56,
        child: TextField(
          onEditingComplete: widget.onSubmitted ?? () {},
          enabled: widget.enabled,
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
            prefixIconConstraints: BoxConstraints(minHeight: 24, minWidth: 24),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: _getClearButton(),
            ),
          ),
        ));
  }
}
