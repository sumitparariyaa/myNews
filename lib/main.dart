import 'package:flutter/material.dart';
import 'package:mynews/mynews.dart';
import 'package:mynews/provider/navigationprovider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
     // const MyNews()
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => NavigationState()),
        ],
      child: const MyNews(),
    )
  );
}




