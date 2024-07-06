class UserModel{
  String? username;
  String? unitName;
  String? email;
  String? provinceName;

  UserModel(this.username,this.email,this.unitName,this.provinceName);

  UserModel.fromJson(Map<String,dynamic>json){
    username = json['user-name'];
    email = json['email'];
    provinceName = json['province-name'];
    unitName = json['unit-name'];
  }

  Map<String,dynamic>toJson()=>{
    'user-name':username,
    'email':email,
    'province-name':provinceName,
    'unit-name':unitName
  };
}