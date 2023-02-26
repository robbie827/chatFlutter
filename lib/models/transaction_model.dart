import 'package:chatflutter/models/currency_model.dart';

List<TransactionModel> transactionModelFromJson(data) =>
    List<TransactionModel>.from(data.map((x) => TransactionModel.fromJson(x)));

class TransactionModel {
  int id;
  String trnx;
  int userId;
  int userType;
  int currencyId;
  int walletId;
  String charge;
  String amount;
  String remark;
  String details;
  String data;
  String createdAt;
  String updatedAt;
  CurrencyModel? currency;

  TransactionModel({
    required this.id,
    required this.trnx,
    required this.userId,
    required this.userType,
    required this.currencyId,
    required this.walletId,
    required this.charge,
    required this.amount,
    required this.remark,
    required this.details,
    required this.data,
    required this.createdAt,
    required this.updatedAt,
    this.currency,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json["id"],
      trnx: json["trnx"],
      userId: json["user_id"],
      userType: json["user_type"],
      currencyId: json["currency_id"],
      walletId: json["wallet_id"],
      charge: json["charge"],
      amount: json["amount"],
      remark: json["remark"],
      details: json["details"],
      data: json["data"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      currency: CurrencyModel.fromJson(json["currency"]),
    );
  }
}
