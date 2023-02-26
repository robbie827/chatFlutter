import 'package:chatflutter/models/currency_model.dart';

List<WalletModel> walletModelFromJson(data) =>
    List<WalletModel>.from(data.map((x) => WalletModel.fromJson(x)));

class WalletModel {
  int id;
  int userId;
  int userType;
  int currencyId;
  String balance;
  int walletType;
  String walletNo;
  String createdAt;
  String updatedAt;
  CurrencyModel? currency;

  WalletModel({
    required this.id,
    required this.userId,
    required this.userType,
    required this.currencyId,
    required this.balance,
    required this.walletType,
    required this.walletNo,
    required this.createdAt,
    required this.updatedAt,
    this.currency,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      id: json["id"],
      userId: json["user_id"],
      userType: json["user_type"],
      currencyId: json["currency_id"],
      balance: json["balance"],
      walletType: json["wallet_type"],
      walletNo: json["wallet_no"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      currency: CurrencyModel.fromJson(json["currency"]),
    );
  }
}
