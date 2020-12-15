export 'UserModel.dart';

class UserModel {
  UserModel({this.id, this.mobile});

  int id = 1;
  String mobile = '123456';
  String headImage = 'img';

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mobile = json['mobile'];
    headImage = json['headImage'];
  }
  UserModel.fromSQL(Map<String, dynamic> json) {
    id = json['id'];
    mobile = json['mobile'];
    headImage = json['headImage'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mobile'] = this.mobile;
    data['headImage'] = this.headImage;
    return data;
  }
}
