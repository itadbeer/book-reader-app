import 'package:ibr/api/author.dart';
import 'package:ibr/api/translator.dart';
import 'package:ibr/models/author.dart';
import 'package:ibr/models/book.dart';
import 'package:ibr/models/category.dart';
import 'package:ibr/models/publisher.dart';
import 'package:ibr/models/translator.dart';
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
        FutureProvider<List<Book>>(
          initialData: [],
          create: (_) => getBooks(limit: 10),
        ),
        FutureProvider<List<Author>>(
          initialData: [],
          create: (_) => getAllAuthors(),
        ),
        FutureProvider<List<Category>>(
          initialData: [],
          create: (_) => getAllCategories(),
        ),
        FutureProvider<List<Translator>>(
          initialData: [],
          create: (_) => getAllTranslators(),
        ),
        FutureProvider<List<Publisher>>(
          initialData: [],
          create: (_) => getAllPublishers(),
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
          '/singleProduct': (context) => BookScreen(),
          '/categories': (context) => Categories(),
          '/category': (context) => CategoryScreen(),
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
