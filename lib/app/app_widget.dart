import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_summary/app/core/app_colors.dart';
import 'package:my_summary/app/modules/summary/summary_page.dart';
import 'package:my_summary/app/shared/models/summary_model.dart';
import 'package:my_summary/app/shared/utils/graphql_connection.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  final int clientID;

  const AppWidget({Key? key, required this.clientID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SummaryModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: AppColors.lightBlueColor,
          appBarTheme: AppBarTheme(backgroundColor: AppColors.lightBlueColor),
        ),
        home: GraphQLProvider(
          key: Key("testGraphQl"),
          child: SummaryPage(
            clientID: clientID,
            key: Key("testSummaryCard"),
          ),
          client: ConnectGraphQl().getClient(),
        ),
      ),
    );
  }
}
