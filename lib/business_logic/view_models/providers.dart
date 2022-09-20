import 'package:flutter/material.dart';
import 'package:outlet/business_logic/view_models/locale_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> listOfProvider(BuildContext ctx) {
  return [
/*    StreamProvider<User?>.value(
      initialData: FirebaseAuth.instance.currentUser,
      value: FirebaseAuth.instance.authStateChanges(),
    ),*/

    ChangeNotifierProvider(create: (ctx) => LocaleViewModel()),
  ];
}
