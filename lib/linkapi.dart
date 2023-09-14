class AppLink {
  static const String server = "http://10.0.0.13/ecommerce/";

  static const String imageststatic = "http://10.0.0.13/ecommerce/";
//========================== Image ============================
  static const String imagestCategories = "$imageststatic/upload/categories/";
  static const String imagestItems = "$imageststatic/upload/items/";
// =============================================================
//
  static const String test = "$server/test.php";

// ================================= Auth ========================== //

  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifycodessignup = "$server/auth/verfiycode.php";
  static const String resend = "$server/auth/resend.php";

// ================================= ForgetPassword ========================== //

  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verfiycode.php";

// Home

  static const String homepage = "$server/home.php";
// items
  static const String items = "$server/items/items.php";
  static const String searchitems = "$server/items/search.php";

// Favorite

  static const String favoriteAdd = "$server/favorite/add_favorite.php";
  static const String favoriteRemove = "$server/favorite/remove_favorite.php";
  static const String deletefromfavorite =
      "$server/favorite/deletefromfavorite.php";
  static const String favoriteView = "$server/favorite/view.php";

// Cart

  static const String cartAdd = "$server/cart/add.php";
  static const String cartDelete = "$server/cart/delete.php";
  static const String cartView = "$server/cart/view.php";
  static const String cartgetCountitems = "$server/cart/getcountitems.php";

  // address
  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressDelete = "$server/address/delete.php";
  static const String addressEdit = "$server/address/edit.php";

  // coupon
  static const String checkcoupon = "$server/coupon/checkcoupon.php";

  // checkout
  static const String checkout = "$server/orders/checkout.php";
}
