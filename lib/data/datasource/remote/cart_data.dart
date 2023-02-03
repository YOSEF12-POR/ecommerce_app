import '/core/class/crud.dart';
import '/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addCart(String usersid, String itemsid) async {
    var response = await crud
        .postData(AppLink.cartAdd, {"userid": usersid, "itemid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  deletecart(String usersid, String itemsid) async {
    var response = await crud
        .postData(AppLink.cartDelete, {"userid": usersid, "itemid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLink.cartgetCountitems, {"userid": usersid, "itemid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(
    String usersid,
  ) async {
    var response = await crud.postData(AppLink.cartView, {"userid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
