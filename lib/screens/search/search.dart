import 'package:ibr/ibr.dart';
import 'package:ibr/utils/option.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: TopBar(
            displayGoBackButton: true,
            displaySearchBar: true,
            displayActionButton: false),
        body: SingleChildScrollView(
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
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          "ترجمه لغات و اصطلاحات کل سلسله العربیة",
                          style: TextStyle(
                              color: onSurfaceMediumEmphasis,
                              fontSize: 16,
                              height: 1.56),
                          overflow: TextOverflow.clip,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ]))));
  }
}
