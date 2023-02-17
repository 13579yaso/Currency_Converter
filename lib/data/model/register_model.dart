class UserRegisterResponse{
  String? $id;
  int? code;
  String? message;
  UserData? userData;
  UserRegisterResponse.fromJson(Map<String,dynamic>json){
    $id=json["\$id"];
    code=json["code"];
    message=json["message"];
    userData=json["data"]!=null?UserData.fromJson(json["data"]):null;

  }
}

class UserData{
  String? $id;
  int? Id;
  String? Name;
  String? Email;
  String? Token;

  UserData.fromJson(Map<String,dynamic>json){
    $id =json["\$id"];
    Id =json["Id"];
    Name =json["Name"];
    Email =json["Email"];
    Token =json["Token"];

  }
}