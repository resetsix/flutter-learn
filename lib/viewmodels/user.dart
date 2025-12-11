class LoginReq {
  String account;
  String password;

  LoginReq({required this.account, required this.password});

  factory LoginReq.fromJson(Map<String, dynamic> json) {
    return LoginReq(
      account: json['account'] as String,
      password: json['password'] as String,
    );
  }
}

class LoginRes {
  String id;
  String account;
  String mobile;
  String token;
  String avatar;
  String nickname;
  String? gender;
  String? birthday;
  String? cityCode;
  String? provinceCode;
  String? profession;

  LoginRes({
    required this.id,
    required this.account,
    required this.mobile,
    required this.token,
    required this.avatar,
    required this.nickname,
    this.gender,
    this.birthday,
    this.cityCode,
    this.provinceCode,
    this.profession,
  });

  factory LoginRes.fromJson(Map<String, dynamic> json) {
    return LoginRes(
      id: json['id'] as String,
      account: json['account'] as String,
      mobile: json['mobile'] as String,
      token: json['token'] as String,
      avatar: json['avatar'] as String,
      nickname: json['nickname'] as String,
      gender: json['gender'] as String?,
      birthday: json['birthday'] as String?,
      cityCode: json['cityCode'] as String?,
      provinceCode: json['provinceCode'] as String?,
      profession: json['profession'] as String?,
    );
  }

  Map<String, String> toJson() {
    return {
      'id': id,
      'account': account,
      'mobile': mobile,
      'token': token,
      'avatar': avatar,
      'nickname': nickname,
    };
  }
}
