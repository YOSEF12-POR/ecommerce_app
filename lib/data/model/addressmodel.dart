class AddressModel {
  String? addressId;
  String? addressUserid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  AddressModel(
      {this.addressId,
      this.addressUserid,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }
}
