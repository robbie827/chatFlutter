import 'dart:ffi';

import 'package:chatflutter/models/transaction_model.dart';
import 'package:chatflutter/models/user_model.dart';
import 'package:chatflutter/models/wallet_model.dart';

List<DataModel> dataModelFromJson(data) =>
    List<DataModel>.from(data.map((x) => DataModel.fromjson(x)));

class DataModel {
  UserModel? user;
  WalletModel wallets;
  TransactionModel transactions;
  Float userBalance;

  DataModel({
    this.user,
    required this.wallets,
    required this.transactions,
    required this.userBalance,
  });

  factory DataModel.fromjson(Map<String, dynamic> json) {
    return DataModel(
      user: UserModel.fromJson(json["user"]),
      wallets: WalletModel.fromJson(json["wallets"]),
      transactions: TransactionModel.fromJson(json["transactions"]),
      userBalance: json["userBalance"],
    );
  }
}
