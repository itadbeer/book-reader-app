import 'package:ibr/ibr.dart';

class Discovery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('کتاب خوان', style: TextStyle(color: onSurfaceHighEmphasis, fontSize: 20)),
        actions: [
          TextButton(
              child: Text('ورود به حساب',
                  style: TextStyle(color: myTheme.primaryColor, fontSize: 16)),
              onPressed: () {})
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(27, 19, 27, 19),
              filled: true,
              fillColor: Color.fromRGBO(0, 0, 0, 0.04),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              hintText: 'جست و جو',
              prefixIcon: Icon(Icons.search, color: Color.fromRGBO(0, 0, 0, 0.4),)),
        ),
      ),
    );
  }
}
