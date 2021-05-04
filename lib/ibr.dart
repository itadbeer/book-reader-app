library ibr;

export 'package:flutter/material.dart';
export 'package:cached_network_image/cached_network_image.dart';

export 'package:ibr/screens/publisherWriterTranslator.dart';
export 'package:ibr/screens/discovery/discovery.dart';
export 'package:ibr/screens/category/categories.dart';
export 'package:ibr/screens/category/category.dart';
export 'package:ibr/screens/product/singleProduct.dart';
export 'package:ibr/screens/login/login.dart';
export 'package:ibr/screens/login/codeVerification.dart';
export 'package:ibr/screens/account/account.dart';
export 'package:ibr/screens/library/library.dart';

//  Utilities
export 'package:ibr/utils/topBar.dart';
export 'package:ibr/utils/theme.dart';
export 'package:ibr/utils/myFloatingNavigationBar.dart';
export 'package:ibr/utils/option.dart';
export 'package:ibr/utils/dialog.dart';
export 'package:ibr/utils/button.dart';

export 'package:flutter_localizations/flutter_localizations.dart';

enum DownloadStatus { downloaded, downloading, normal }
