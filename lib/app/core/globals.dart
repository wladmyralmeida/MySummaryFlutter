class Globals {
  static const api = 'https://harura-fliper-test.herokuapp.com/v1/graphql';
  static const headerKey = "x-hasura-admin-secret";
  static const secretKey = 'secret';
  static const wealthSummaryKey = 'wealthSummary';

  static const summaryQuery = '''
  query Query {
    wealthSummary {
      id
      cdi
      gain
      hasHistory
      profitability
      total
    }
  }
  ''';
}
