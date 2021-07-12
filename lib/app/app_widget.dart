import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_summary/app/core/app_colors.dart';
import 'package:my_summary/app/core/app_strings.dart';
import 'package:my_summary/app/modules/summary/summary_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_summary/app/shared/utils/graphql_connection.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: AppColors.lightBlueColor,
          appBarTheme: AppBarTheme(backgroundColor: AppColors.lightBlueColor)),
      home: GraphQLProvider(
        key: Key("testGraphQl"),
        child: SummaryPage(),
        client: ConnectGraphQl().getClient(),
      ),
    ).modular();
  }
}
