List<UserModel> chatUserFromJson(data) =>
    List<UserModel>.from(data.map((x) => UserModel.fromJson(x)));

class UserModel {
  int id;
  int bankPlanId;
  String accountNumber;
  String name;
  String dob;
  String? photo;
  String? city;
  String? address;
  String? phone;
  String? email;
  String createdAt;
  String updatedAt;
  String verficationLink;
  String emailVerified;
  String affilateCode;
  int referralId;
  int verified;
  String planEndDate;
  String section;
  String modules;
  String walletMaintenance;
  String cardMaintenance;
  String? companyName;

  UserModel({
    required this.id,
    required this.bankPlanId,
    required this.accountNumber,
    required this.name,
    required this.dob,
    this.photo,
    this.city,
    this.address,
    this.phone,
    this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.verficationLink,
    required this.emailVerified,
    required this.affilateCode,
    required this.referralId,
    required this.verified,
    required this.planEndDate,
    required this.section,
    required this.modules,
    required this.walletMaintenance,
    required this.cardMaintenance,
    this.companyName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      bankPlanId: json["bank_plan_id"],
      accountNumber: json["account_number"],
      name: json["name"],
      dob: json["dob"],
      photo: json["photo"],
      city: json["city"],
      address: json["address"],
      phone: json["phone"],
      email: json["email"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      verficationLink: json["verification_link"],
      emailVerified: json["email_verified"],
      affilateCode: json["affilate_code"],
      referralId: json["referral_id"],
      verified: json["verified"],
      planEndDate: json["plan_end_date"],
      section: json["section"],
      modules: json["modules"],
      walletMaintenance: json["wallet_maintenance"],
      cardMaintenance: json["card_maintenance"],
      companyName: json["company_name"],
    );
  }
}
