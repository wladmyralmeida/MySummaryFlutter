import 'package:mobx/mobx.dart';
import 'package:my_summary/app/services/summary_service.dart';
import 'package:my_summary/app/shared/models/summary_model.dart';

part 'summary_controller.g.dart';

class SummaryController = _SummaryBase with _$SummaryController;

abstract class _SummaryBase with Store {
  final SummaryService summaryService;

  @observable
  late SummaryModel summary;

  _SummaryBase({required this.summaryService});

  @action
  Future<SummaryModel> getSummary() async {
    final response = await summaryService.getSummary();
    summary = SummaryModel.fromJson(response);
    return summary;
  }
}
