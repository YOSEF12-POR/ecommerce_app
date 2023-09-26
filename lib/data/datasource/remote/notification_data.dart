import '/core/class/crud.dart';
import '/linkapi.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);
  getData(String userid) async {
    var response = await crud.postData(AppLink.notification, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }
}
