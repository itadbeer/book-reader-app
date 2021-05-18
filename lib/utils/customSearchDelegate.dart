import 'package:ibr/ibr.dart';
import 'package:ibr/models/book.dart';
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
    final TextEditingController _searchController = TextEditingController();
    return [
      IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: onSurfaceMediumEmphasis,
          ),
          onPressed: () {
            Provider.of<SearchHandler>(context, listen: false).setCharLength(0);
            close(context, null);
          }),
      Expanded(
        child: Container(
            margin: EdgeInsets.fromLTRB(16, 8, 0, 8),
            child: SearchBar(
              searchController: _searchController,
              enabled: true,
              width: 318,
              height: 40,
              onSubmitted: () {
                if (_searchController.text.isNotEmpty) {
                  query = _searchController.text;
                }
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
    return query.isNotEmpty
        ? Container(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                    child: Column(children: [
                  showMatchedBooks(context),
                  ...showMatchedCategories(context),
                  ...showMatchedAuthors(context),
                  ...showMatchedTranslators(context),
                  ...showMatchedPublishers(context),
                ]))))
        : Container();
  }

  showMatchedBooks(BuildContext context) {
    List<Widget> options = [];

    return FutureBuilder(
        future: searchBook(context, bookName: query),
        builder: (BuildContext context, AsyncSnapshot<List<Book>> results) {
          switch (results.connectionState) {
            case ConnectionState.waiting:
              return LoadingDialog();
            default:
              if (results.hasError)
                return Text(
                  'مشکلی رخ داده',
                  style: TextStyle(color: error),
                );
              else {
                if (results.data.length > 0) {
                  results.data.forEach((book) {
                    options.add(Option(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(16, 4, 16, 4),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: CachedNetworkImage(
                                  imageUrl: book.image,
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
                                  book.name,
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
                    ));
                  });
                }
              }
              return Column(children: options);
          }
        });
  }

  showMatchedAuthors(BuildContext context) {
    final results = searchAuthor(context, authorName: query);
    List<Widget> options = [];
    if (results.length > 0) {
      results.forEach((match) {
        options.add(Option(
          padding: EdgeInsets.all(16),
          children: [
            Text("نویسنده: ${match.name}",
                style: TextStyle(
                    color: onSurfaceMediumEmphasis, fontSize: 16, height: 1.5))
          ],
        ));
      });
      return options;
    }
    return [Container()];
  }

  showMatchedCategories(BuildContext context) {
    final results = searchCategory(context, categoryName: query);
    List<Widget> options = [];
    if (results.length > 0) {
      results.forEach((match) {
        options.add(Option(
          padding: EdgeInsets.all(16),
          children: [
            Text("دسته بندی: ${match.name}",
                style: TextStyle(
                    color: onSurfaceMediumEmphasis, fontSize: 16, height: 1.5))
          ],
        ));
      });
      return options;
    }
    return [Container()];
  }

  showMatchedTranslators(BuildContext context) {
    final results = searchTranslator(context, translatorName: query);
    List<Widget> options = [];
    if (results.length > 0) {
      results.forEach((match) {
        options.add(Option(
          padding: EdgeInsets.all(16),
          children: [
            Text("مترجم: ${match.name}",
                style: TextStyle(
                    color: onSurfaceMediumEmphasis, fontSize: 16, height: 1.5))
          ],
        ));
      });
      return options;
    }
    return [Container()];
  }

  showMatchedPublishers(BuildContext context) {
    final results = searchPublisher(context, publisherName: query);
    List<Widget> options = [];
    if (results.length > 0) {
      results.forEach((match) {
        options.add(Option(
          padding: EdgeInsets.all(16),
          children: [
            Text("ناشر: ${match.name}",
                style: TextStyle(
                    color: onSurfaceMediumEmphasis, fontSize: 16, height: 1.5))
          ],
        ));
      });
      return options;
    }
    return [Container()];
  }
}
