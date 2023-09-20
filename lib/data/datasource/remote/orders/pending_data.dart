import '/core/class/crud.dart';
import '/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData(String userid) async {
    var response = await crud.postData(AppLink.pendingordres, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }
}
