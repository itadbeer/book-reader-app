library ibr;

// Dependecy libraries
export 'package:flutter/material.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:provider/provider.dart';
export 'package:flutter_localizations/flutter_localizations.dart';
export 'package:http/http.dart';
export 'dart:convert';
export 'package:get_storage/get_storage.dart';
export 'package:zarinpal/zarinpal.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:uni_links/uni_links.dart';
export 'dart:io';
export 'dart:async';

// API functions
export 'package:ibr/api/author.dart';
export 'package:ibr/api/books.dart';
export 'package:ibr/api/category.dart';
export 'package:ibr/api/codeVerification.dart';
export 'package:ibr/api/login.dart';
export 'package:ibr/api/publisher.dart';
export 'package:ibr/api/translator.dart';

// Functions
export 'package:ibr/functions/validation.dart';
export 'package:ibr/functions/authentication.dart';
export 'package:ibr/functions/browser.dart';
export 'package:ibr/functions/payment.dart';

// Providers
export 'package:ibr/providers/userHandler.dart';
export 'package:ibr/providers/textBoxProvider.dart';
export 'package:ibr/providers/buttonProvider.dart';
export 'package:ibr/providers/timerProvider.dart';
export 'package:ibr/providers/bookProvider.dart';
export 'package:ibr/providers/searchFieldHandler.dart';
export 'package:ibr/providers/paymentProvider.dart';

// Screens
export 'package:ibr/screens/publisher/publisher.dart';
export 'package:ibr/screens/author/author.dart';
export 'package:ibr/screens/translator/translator.dart';
export 'package:ibr/screens/discovery/discovery.dart';
export 'package:ibr/screens/category/categories.dart';
export 'package:ibr/screens/category/category.dart';
export 'package:ibr/screens/book/book.dart';
export 'package:ibr/screens/book/books.dart';
export 'package:ibr/screens/login/login.dart';
export 'package:ibr/screens/login/codeVerification.dart';
export 'package:ibr/screens/account/account.dart';
export 'package:ibr/screens/library/library.dart';

//  Utilities
export 'package:ibr/utils/topBar.dart';
export 'package:ibr/utils/theme.dart';
export 'package:ibr/utils/myFloatingNavigationBar.dart';
export 'package:ibr/utils/option.dart';
export 'package:ibr/utils/button.dart';
export 'package:ibr/utils/customSearchDelegate.dart';
export 'package:ibr/utils/myTextBox.dart';
export 'package:ibr/utils/loadingDialog.dart';

const bool isProduction = false;

enum DownloadStatus { downloaded, downloading, normal }

// API configurations
String endpoint = "https://192.168.0.102:7000/";
Map<String, String> headers = {
  'api_version': '1.0',
  'secret_key': 'thisisasimpletest,justatest,yeah,no,yeah,no,tea,coffe,test',
};

// Zarinpal Gateway configurations
const String merchantID = "32aaa4d0-a667-11e9-98b0-000c29344814";
const String callbackURL = "ibr://islamicbookreader.com";
