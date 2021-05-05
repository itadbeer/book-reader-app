import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:ibr/ibr.dart';
import 'package:ibr/screens/library/widgets/myDropdownButton.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class LibraryItem extends StatefulWidget {
  final String name;
  final String thumbnailUrl;
  final DownloadStatus status;
  const LibraryItem({Key key, this.name, this.thumbnailUrl, this.status})
      : super(key: key);

  @override
  _LibraryItemState createState() => _LibraryItemState();
}

class _LibraryItemState extends State<LibraryItem> with RouteAware {
  GlobalKey actionKey;
  double height, width, xPosition, yPosition;
  OverlayEntry floatingDropdown;
  bool isDropdownOpened = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // routeObserver is the global variable we created before
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPop() {
    floatingDropdown.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16),
      height: 96,
      decoration: BoxDecoration(
        color: onPrimaryHighEmphasis,
        border: Border.all(color: onSurfaceBorder, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Column(children: [
            Container(
              padding: EdgeInsets.all(8),
              width: 72,
              height: 92.11,
              child: GestureDetector(
                onTap: () => {Navigator.pushNamed(context, '/singleProduct')},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: widget.thumbnailUrl,
                  ),
                ),
              ),
            ),
          ]),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Container(
                margin: EdgeInsets.only(top: 16, bottom: 12),
                child: GestureDetector(
                  onTap: () => {Navigator.pushNamed(context, '/singleProduct')},
                  child: Text(
                    widget.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ]),
            buildDownloadBar(widget.status),
          ]),
        ],
      ),
    );
  }

  Row buildDownloadBar(DownloadStatus status) {
    GlobalKey theButtonKey = GlobalKey();
    switch (status) {
      case DownloadStatus.normal:
        return Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Button(
                text: "دانلود",
              ),
            ),
            Container(
                child: Button(
              padding: EdgeInsets.symmetric(vertical: 7),
              backgroundColor: Colors.transparent,
              text: "آمادۀ دانلود",
              textColor: onSurfaceMediumEmphasis,
            )),
          ],
        );
      case DownloadStatus.downloading:
        return Row(children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Button(
              padding: EdgeInsets.symmetric(vertical: 7),
              backgroundColor: Colors.transparent,
              textColor: myTheme.primaryColor,
              text: "در حال دانلود...",
            ),
          ),
          PopupMenuButton(
            offset: Offset.fromDirection(pi / 2, 40),
            tooltip: "لغو دانلود",
            child: Button(
              key: theButtonKey,
              backgroundColor: error,
              text: "لغو دانلود",
              textColor: onPrimaryHighEmphasis,
            ),
            // onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  height: 32,
                  value: "لغو دانلود",
                  child: Text(
                    "لغو دانلود",
                    style: TextStyle(
                        color: onSurfaceMediumEmphasis,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        height: 1.5),
                  ),
                ),
              ];
            },
          ),
        ]);
      case DownloadStatus.downloaded:
        return Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Button(
                text: "خواندن",
              ),
            ),
            PopupMenuButton(
              offset: Offset.fromDirection(pi / 2, 40),
              tooltip: "حذف دانلود",
              child: Button(
                padding: EdgeInsets.symmetric(vertical: 7),
                backgroundColor: Colors.transparent,
                text: "حذف دانلود",
                textColor: error,
              ),
              // onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    height: 32,
                    value: "حذف دانلود",
                    child: Text(
                      "حذف دانلود",
                      style: TextStyle(
                          color: onSurfaceMediumEmphasis,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          height: 1.5),
                    ),
                  ),
                ];
              },
            ),
          ],
        );
      default:
        return Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Button(
                text: "دانلود",
              ),
            ),
            Container(
                child: Button(
              padding: EdgeInsets.symmetric(vertical: 7),
              backgroundColor: Colors.transparent,
              text: "آمادۀ دانلود",
              textColor: onSurfaceMediumEmphasis,
            ))
          ],
        );
    }
  }

  OverlayEntry createDropdown() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        top: yPosition + height + 4,
        right: xPosition - width + 42,
        child: MyDropdownButton(
          backgroundColor: error,
          text: "لغو دانلود",
          textColor: onPrimaryHighEmphasis,
        ),
      );
    });
  }

  void closeDropdown() {
    floatingDropdown.remove();
  }

  void openDropdown() {
    RenderBox renderBox = actionKey.currentContext.findRenderObject();
    Offset offset = renderBox.localToGlobal(Offset.zero);
    height = renderBox.size.height;
    width = renderBox.size.width;
    xPosition = offset.dx;
    yPosition = offset.dy;

    floatingDropdown = createDropdown();
    Overlay.of(context).insert(floatingDropdown);
  }
}
