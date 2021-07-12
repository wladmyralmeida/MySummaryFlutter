import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_summary/app/core/globals.dart';

class SummaryService {
  final GraphQLClient graphQLClient;

  SummaryService(this.graphQLClient);

  Future<Map<String, dynamic>> getSummary() async {
    final result = await graphQLClient
        .query(QueryOptions(document: gql(Globals.summaryQuery)));
    final summaries = result.data?[Globals.wealthSummaryKey] as List;
    return summaries.first;
  }
}
