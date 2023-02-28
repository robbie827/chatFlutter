List<UserModel> userModelFromJson(data) =>
    List<UserModel>.from(data.map((x) => UserModel.fromJson(x)));

class UserModel {
  int? id;
  String? accountNumber;
  String? name;
  String? zip;
  String? dob;
  String? photo;
  String? city;
  String? address;
  String? country;
  String? phone;
  String? email;
  String? verificationLink;
  String? affilateCode;
  String? section;
  String? modules;
  String? companyName;
  String? personalCode;
  String? yourId;
  String? issuedAuthority;
  String? dateOfIssue;
  String? dateOfExpire;
  String? signature;
  String? stamp;
  String? avatar;
  String? authority;

  UserModel({
    this.id,
    this.accountNumber,
    this.name,
    this.zip,
    this.dob,
    this.photo,
    this.city,
    this.address,
    this.country,
    this.phone,
    this.email,
    this.verificationLink,
    this.affilateCode,
    this.section,
    this.modules,
    this.companyName,
    this.personalCode,
    this.yourId,
    this.issuedAuthority,
    this.dateOfIssue,
    this.dateOfExpire,
    this.signature,
    this.stamp,
    this.avatar,
    this.authority,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      accountNumber: json["account_number"] ?? "",
      name: json["name"] ?? "",
      zip: json["zip"] ?? "",
      dob: json["dob"] ?? "",
      photo: json["photo"] ?? "",
      city: json["city"] ?? "",
      address: json["address"] ?? "",
      country: json["country"] ?? "",
      phone: json["phone"] ?? "",
      email: json["email"] ?? "",
      verificationLink: json["verification_link"] ?? "",
      affilateCode: json["affilate_code"] ?? "",
      section: json["section"] ?? "",
      modules: json["modules"] ?? "",
      companyName: json["company_name"] ?? "",
      personalCode: json["personal_code"] ?? "",
      yourId: json["your_id"] ?? "",
      issuedAuthority: json["issued_authority"] ?? "",
      dateOfIssue: json["date_of_issue"] ?? "",
      dateOfExpire: json["date_of_expire"] ?? "",
      signature: json["signature"] ?? "",
      stamp: json["stamp"] ?? "",
      avatar: json["avatar"] ?? "",
      authority: json["issued_authority"] ?? "",
    );
  }
}
