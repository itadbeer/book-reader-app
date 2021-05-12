import 'package:ibr/ibr.dart';

class MyTextBox extends StatelessWidget {
  final String caption;
  final String placeholder;
  final controller;
  final Function onEditingComplete;
  final Function onChanged;
  final TextInputType keyboardType;
  final int maxLength;

  MyTextBox(
      {Key key,
      this.caption,
      this.placeholder,
      this.controller,
      this.onEditingComplete,
      this.keyboardType,
      this.onChanged,
      this.maxLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textBoxProvider = Provider.of<TextBoxProvider>(context);
    return Column(
      children: [
        Row(
          children: [
            Container(
                margin: EdgeInsets.only(top: 24),
                child: Text(this.caption,
                    style: TextStyle(
                        color: setColor(textBoxProvider.state), fontSize: 16)))
          ],
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 8),
              width: MediaQuery.of(context).size.width - 32,
              child: Focus(
                onFocusChange: (hasFocus) {
                  textBoxProvider.setSate(
                      hasFocus ? TextBoxState.active : TextBoxState.normal);
                },
                child: TextField(
                  maxLength: maxLength,
                  keyboardType: keyboardType ?? TextInputType.text,
                  onEditingComplete: onEditingComplete ?? () {},
                  onChanged: onChanged ?? (String text) => {},
                  controller: controller,
                  // fixme: we need to get the input acion from method parameters, it can be different for each use case
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(right: 24, left: 24),
                    filled: true,
                    fillColor: Color.fromRGBO(0, 0, 0, 0.04),
                    labelStyle:
                        TextStyle(color: onSurfaceHighEmphasis, fontSize: 16),
                    hintTextDirection: TextDirection.rtl,
                    hintStyle:
                        TextStyle(color: onSurfaceDisabled, fontSize: 16),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(16)),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: primaryLightVariant),
                        borderRadius: BorderRadius.circular(16)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(16)),
                    hintText: this.placeholder ?? "",
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  setColor(TextBoxState state) {
    switch (state) {
      case TextBoxState.active:
        return myTheme.primaryColor;
      case TextBoxState.normal:
        return onSurfaceMediumEmphasis;
      default:
        return onSurfaceMediumEmphasis;
    }
  }
}
