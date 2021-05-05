import 'package:flutter/foundation.dart';
import 'package:ibr/ibr.dart';
import 'package:ibr/screens/library/widgets/myDropdownButton.dart';

class LibraryItem extends StatefulWidget {
  final String name;
  final String thumbnailUrl;
  final DownloadStatus status;
  const LibraryItem({Key key, this.name, this.thumbnailUrl, this.status})
      : super(key: key);

  @override
  _LibraryItemState createState() => _LibraryItemState();
}

class _LibraryItemState extends State<LibraryItem> {
  bool show_delete_confirmation = false;

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
            Stack(clipBehavior: Clip.none, children: [
              Container(
                  child: Button(
                onPressed: () {
                  setState(() {
                    show_delete_confirmation = !show_delete_confirmation;
                  });
                  print(show_delete_confirmation);
                },
                backgroundColor: error,
                text: "لغو دانلود",
                textColor: onPrimaryHighEmphasis,
              )),
              Positioned(
                top: 40,
                right: 0,
                child: Visibility(
                  visible: show_delete_confirmation,
                  child: MyDropdownButton(
                    backgroundColor: error,
                    text: "لغو دانلود",
                    textColor: onPrimaryHighEmphasis,
                  ),
                ),
              ),
            ]),
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
