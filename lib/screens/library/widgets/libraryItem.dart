import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:ibr/ibr.dart';

class LibraryItem extends StatelessWidget {
  final String name;
  final String thumbnailUrl;
  final DownloadStatus status;
  const LibraryItem({Key key, this.name, this.thumbnailUrl, this.status})
      : super(key: key);

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
                    imageUrl: thumbnailUrl,
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
                    name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ]),
            buildDownloadBar(status),
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
}
