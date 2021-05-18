import 'package:ibr/providers/searchFieldHandler.dart';
import 'package:ibr/ibr.dart';

class SearchBar extends StatelessWidget {
  final Function onSubmitted;
  final double height;
  final double width;
  final bool enabled;
  final TextEditingController searchController;
  SearchBar({
    Key key,
    this.height,
    this.width,
    this.enabled,
    this.onSubmitted,
    this.searchController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchHandler = Provider.of<SearchHandler>(context);
    return Container(
        width: width ?? MediaQuery.of(context).size.width - 32,
        height: height ?? 56,
        child: TextField(
          controller: searchController,
          onEditingComplete: () {
            onSubmitted();
            // as query is going to be reset after submittion,
            // we set char length to 0 to avoid showing clear button
            // while we technically have nothing in textbox
            searchHandler.setCharLength(0);
          },
          enabled: enabled,
          onChanged: (String value) {
            searchHandler.setCharLength(searchController.text.length);
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            alignLabelWithHint: true,
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
              child: searchHandler.charLength > 0
                  ? IconButton(
                      onPressed: () => searchController.clear(),
                      icon: Icon(Icons.clear),
                      color: onSurfaceMediumEmphasis,
                    )
                  : null,
            ),
          ),
        ));
  }
}
