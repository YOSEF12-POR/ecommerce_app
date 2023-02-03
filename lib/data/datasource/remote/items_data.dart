import '/core/class/crud.dart';
import '/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String id, String userid) async {
    var response = await crud
        .postData(AppLink.items, {"id": id.toString(), "usersid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
