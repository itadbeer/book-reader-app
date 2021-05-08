import 'package:ibr/ibr.dart';
import 'package:ibr/screens/discovery/widgets/searchBar.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate({
    String hintText,
  }) : super(
            searchFieldLabel: hintText,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            searchFieldDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(
                  color: onSurfaceDisabled,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  height: 1.56),
              fillColor: Color.fromRGBO(0, 0, 0, 0.04),
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(24, 8, 24, 8),
            ));

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: onSurfaceMediumEmphasis,
          ),
          onPressed: () {
            close(context, null);
          }),
      Expanded(
        child: Container(
            margin: EdgeInsets.fromLTRB(16, 8, 0, 8),
            child: SearchBar(
              enabled: true,
              width: 318,
              height: 40,
              onSubmitted: () {
                query = "متن تستی جدید";
              },
            )),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return Container(
      height: 0,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                child: Column(children: [
              Option(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(16, 4, 16, 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://imgcdn.taaghche.com/frontCover/38729.jpg',
                            width: 36,
                            height: 48,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            query,
                            style: TextStyle(
                                color: onSurfaceMediumEmphasis,
                                fontSize: 16,
                                height: 1.56),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Option(
                padding: EdgeInsets.all(16),
                children: [
                  Text("دسته بندی: $query",
                      style: TextStyle(
                          color: onSurfaceMediumEmphasis,
                          fontSize: 16,
                          height: 1.5))
                ],
              ),
              Option(
                padding: EdgeInsets.all(16),
                children: [
                  Text("نویسنده: $query",
                      style: TextStyle(
                          color: onSurfaceMediumEmphasis,
                          fontSize: 16,
                          height: 1.5))
                ],
              ),
              Option(
                padding: EdgeInsets.all(16),
                children: [
                  Text("مترجم: $query",
                      style: TextStyle(
                          color: onSurfaceMediumEmphasis,
                          fontSize: 16,
                          height: 1.5))
                ],
              ),
              Option(
                padding: EdgeInsets.all(16),
                children: [
                  Text("ناشر: $query",
                      style: TextStyle(
                          color: onSurfaceMediumEmphasis,
                          fontSize: 16,
                          height: 1.5))
                ],
              ),
            ]))));
  }
}
