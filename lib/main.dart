import 'package:ibr/SearchFieldHandler.dart';
import 'package:ibr/ibr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchHandler>(
            create: (context) => SearchHandler()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("fa", "IR"),
        ],
        locale: Locale("fa", "IR"),
        title: 'کتابخوان اسلامی',
        theme: myTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => Discovery(),
          '/singleProduct': (context) => SingleProduct(),
          '/categories': (context) => Categories(),
          '/category': (context) => Category(),
          '/publisherWriterTranslator': (context) =>
              PublisherWriterTranslator(),
          '/login': (context) => Login(),
          '/codeVerification': (context) => CodeVerification(),
          '/account': (context) => Account(),
          '/library': (context) => Library(),
        },
      ),
    );
  }
}
