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
                    imageUrl: this.thumbnailUrl,
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
                    this.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ]),
            buildDownloadBar(this.status),
          ]),
        ],
      ),
    );
  }

  Row buildDownloadBar(DownloadStatus status) {
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
            ))
          ],
        );
      case DownloadStatus.downloading:
        return Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Button(
                padding: EdgeInsets.symmetric(vertical: 7),
                backgroundColor: Colors.transparent,
                textColor: myTheme.primaryColor,
                text: "در حال دانلود...",
              ),
            ),
            Container(
                child: Button(
              backgroundColor: error,
              text: "لغو دانلود",
              textColor: onPrimaryHighEmphasis,
            ))
          ],
        );
      case DownloadStatus.downloaded:
        return Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Button(
                text: "خواندن",
              ),
            ),
            Container(
                child: Button(
              padding: EdgeInsets.symmetric(vertical: 7),
              backgroundColor: Colors.transparent,
              text: "حذف دانلود",
              textColor: error,
            ))
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
