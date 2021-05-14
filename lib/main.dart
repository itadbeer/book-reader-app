import 'package:ibr/providers/searchFieldHandler.dart';
import 'package:ibr/ibr.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchHandler>(
            create: (context) => SearchHandler()),
        ChangeNotifierProvider<UserHandler>(
          create: (context) => UserHandler(),
        ),
        ChangeNotifierProvider<ButtonProvider>(
          create: (context) => ButtonProvider(ButtonState.disabled),
        ),
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
          '/login': (context) => LoginScreen(),
          '/codeVerification': (context) =>
              ChangeNotifierProvider<TextBoxProvider>(
                create: (context) => TextBoxProvider(TextBoxState.normal),
                child: CodeVerificationScreen(),
              ),
          '/account': (context) => Account(),
          '/library': (context) => Library(),
        },
      ),
    );
  }
}
