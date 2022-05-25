import 'package:location_alert/datas/helpers/db_helper.dart';
import 'package:location_alert/datas/models/alert_model.dart';

class MainRepositorys {
  Future<List<AlertModel>> getActiveAlertModel() {
    try {
      return DbHelper.instance.getAlertByStatus(true);
    } catch (e) {
      throw e;
    }
  }
}
