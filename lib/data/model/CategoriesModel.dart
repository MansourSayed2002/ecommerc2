class CategoriesModel {
  int? cId;
  String? cName;
  String? cNameAr;
  String? cImage;
  String? cTime;

  CategoriesModel(
      {this.cId, this.cName, this.cNameAr, this.cImage, this.cTime});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    cId = json['c_id'];
    cName = json['c_name'];
    cNameAr = json['c_name_ar'];
    cImage = json['c_image'];
    cTime = json['c_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['c_id'] = cId;
    data['c_name'] = cName;
    data['c_name_ar'] = cNameAr;
    data['c_image'] = cImage;
    data['c_time'] = cTime;
    return data;
  }
}
