import '/core/class/crud.dart';
import '/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFavorite(String usersid, String itemsid) async {
    var response = await crud
        .postData(AppLink.favoriteAdd, {"userid": usersid, "itemid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLink.favoriteRemove, {"userid": usersid, "itemid": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
