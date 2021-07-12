import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_summary/app/modules/summary/summary_controller.dart';
import 'package:my_summary/app/modules/summary/summary_page.dart';
import 'package:my_summary/app/services/summary_service.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind(
          (i) =>
              SummaryController(summaryService: Modular.get<SummaryService>()),
        ),
        Bind(
          (i) => SummaryService(Modular.get<GraphQLClient>()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => SummaryPage()),
      ];
}
