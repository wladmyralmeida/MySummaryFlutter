import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_summary/app/core/globals.dart';

class ConnectGraphQl {
  final WebSocketLink websocketLink = WebSocketLink(
    Globals.api,
    config: SocketClientConfig(
        autoReconnect: true,
        inactivityTimeout: Duration(seconds: 30),
        initialPayload: () async {
          return {
            'headers': {Globals.headerKey: Globals.secretKey},
          };
        }),
  );

  ValueNotifier<GraphQLClient> getClient() {
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(
          partialDataPolicy: PartialDataCachePolicy.acceptForOptimisticData,
        ),
        link: websocketLink,
      ),
    );

    return client;
  }

  String getWealthSummaryByPK({required int clientID}) {
    return "subscription { wealthSummary_by_pk(id: $clientID) { id, total, hasHistory, cdi, gain, profitability } }";
  }
}
