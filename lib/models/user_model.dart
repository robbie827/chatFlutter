List<UserModel> userModelFromJson(data) =>
    List<UserModel>.from(data.map((x) => UserModel.fromJson(x)));

class UserModel {
  int? id;
  String? accountNumber;
  String? name;
  String? dob;
  String? photo;
  String? city;
  String? address;
  String? phone;
  String? email;
  String? verificationLink;
  String? affilateCode;
  String? section;
  String? modules;
  String? companyName;

  UserModel({
    this.id,
    this.accountNumber,
    this.name,
    this.dob,
    this.photo,
    this.city,
    this.address,
    this.phone,
    this.email,
    this.verificationLink,
    this.affilateCode,
    this.section,
    this.modules,
    this.companyName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      accountNumber: json["account_number"] ?? "",
      name: json["name"] ?? "",
      dob: json["dob"] ?? "",
      photo: json["photo"] ?? "",
      city: json["city"] ?? "",
      address: json["address"] ?? "",
      phone: json["phone"] ?? "",
      email: json["email"] ?? "",
      verificationLink: json["verification_link"] ?? "",
      affilateCode: json["affilate_code"] ?? "",
      section: json["section"] ?? "",
      modules: json["modules"] ?? "",
      companyName: json["company_name"] ?? "",
    );
  }
}
