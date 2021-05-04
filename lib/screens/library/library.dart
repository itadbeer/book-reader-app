import 'package:ibr/ibr.dart';
import 'package:ibr/screens/library/widgets/LibraryItem.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: TopBar(
          title: "کتابخانۀ من",
          displayGoBackButton: false,
          displayActionButton: false),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            child: Column(
          children: <Widget>[
            TabBar(
                unselectedLabelColor: onSurfaceMediumEmphasis,
                labelColor: myTheme.primaryColor,
                labelPadding:
                    EdgeInsets.only(top: 13, bottom: 13, left: 61, right: 61),
                labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Vazir',
                    height: 1.5),
                indicatorColor: myTheme.primaryColor,
                indicatorWeight: 2,
                controller: _tabController,
                tabs: <Widget>[
                  Tab(
                    text: 'کتاب‌های من',
                  ),
                  Tab(
                    text: "مدیریت دانلودها",
                  )
                ]),
            Container(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              height: 400,
              child: TabBarView(controller: _tabController, children: [
                buildMyBooksTabContents(),
                buildDownloadManagementTabContents(),
              ]),
            )
          ],
        )),
      ),
      bottomNavigationBar: MyFloatingNavigationBar(),
    );
  }

  Column buildDownloadManagementTabContents() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 8),
                child: LibraryItem(
                  status: DownloadStatus.downloading,
                  name: "ترجمه لغات و اصطلاحات کل سلسله العربی",
                  thumbnailUrl:
                      "https://imgcdn.taaghche.com/frontCover/38729.jpg",
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 8),
                child: LibraryItem(
                  status: DownloadStatus.downloaded,
                  name: "ترجمه لغات و اصطلاحات کل سلسله العربی",
                  thumbnailUrl:
                      "https://imgcdn.taaghche.com/frontCover/38729.jpg",
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 8),
                child: LibraryItem(
                  status: DownloadStatus.normal,
                  name: "ترجمه لغات و اصطلاحات کل سلسله العربی",
                  thumbnailUrl:
                      "https://imgcdn.taaghche.com/frontCover/38729.jpg",
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column buildMyBooksTabContents() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 8),
                child: LibraryItem(
                  status: DownloadStatus.downloading,
                  name: "ترجمه لغات و اصطلاحات کل سلسله العربی",
                  thumbnailUrl:
                      "https://imgcdn.taaghche.com/frontCover/38729.jpg",
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 8),
                child: LibraryItem(
                  status: DownloadStatus.downloaded,
                  name: "ترجمه لغات و اصطلاحات کل سلسله العربی",
                  thumbnailUrl:
                      "https://imgcdn.taaghche.com/frontCover/38729.jpg",
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 8),
                child: LibraryItem(
                  status: DownloadStatus.normal,
                  name: "ترجمه لغات و اصطلاحات کل سلسله العربی",
                  thumbnailUrl:
                      "https://imgcdn.taaghche.com/frontCover/38729.jpg",
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
