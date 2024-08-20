class OrderAddressModel {
  int? ordersId;
  int? ordersUserid;
  int? ordersCoupon;
  int? ordersDelivery;
  int? ordersPaymentmethod;
  int? ordersAddress;
  int? ordersPricedelivary;
  int? ordersTotalprice;
  int? ordersPrice;
  int? ordersStatus;
  String? ordersTime;
  int? addressId;
  int? addressUserid;
  double? addressLat;
  double? addressLong;
  String? addressCountry;
  String? addressCity;
  String? addressStreet;
  int? addressPricedelivary;

  OrderAddressModel(
      {this.ordersId,
      this.ordersUserid,
      this.ordersCoupon,
      this.ordersDelivery,
      this.ordersPaymentmethod,
      this.ordersAddress,
      this.ordersPricedelivary,
      this.ordersTotalprice,
      this.ordersPrice,
      this.ordersStatus,
      this.ordersTime,
      this.addressId,
      this.addressUserid,
      this.addressLat,
      this.addressLong,
      this.addressCountry,
      this.addressCity,
      this.addressStreet,
      this.addressPricedelivary});

  OrderAddressModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersCoupon = json['orders_coupon'];
    ordersDelivery = json['orders_delivery'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersAddress = json['orders_address'];
    ordersPricedelivary = json['orders_pricedelivary'];
    ordersTotalprice = json['orders_totalprice'];
    ordersPrice = json['orders_price'];
    ordersStatus = json['orders_status'];
    ordersTime = json['orders_time'];
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressCountry = json['address_country'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressPricedelivary = json['address_pricedelivary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders_id'] = ordersId;
    data['orders_userid'] = ordersUserid;
    data['orders_coupon'] = ordersCoupon;
    data['orders_delivery'] = ordersDelivery;
    data['orders_paymentmethod'] = ordersPaymentmethod;
    data['orders_address'] = ordersAddress;
    data['orders_pricedelivary'] = ordersPricedelivary;
    data['orders_totalprice'] = ordersTotalprice;
    data['orders_price'] = ordersPrice;
    data['orders_status'] = ordersStatus;
    data['orders_time'] = ordersTime;
    data['address_id'] = addressId;
    data['address_userid'] = addressUserid;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    data['address_country'] = addressCountry;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_pricedelivary'] = addressPricedelivary;
    return data;
  }
}
