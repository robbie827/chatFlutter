import 'package:chatflutter/models/transaction_model.dart';
import 'package:chatflutter/models/user_model.dart';
import 'package:chatflutter/models/wallet_model.dart';

// List<DashboardModel> dataModelFromJson(data) =>
//     List<DashboardModel>.from(data.map((x) => DashboardModel.fromJson(x)));

class DashboardModel {
  UserModel? user;
  List<WalletModel>? wallets;
  List<TransactionModel>? transactions;
  double? userBalance;

  DashboardModel({
    this.user,
    this.wallets,
    this.transactions,
    this.userBalance,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      user: UserModel.fromJson(json["user"]),
      wallets: walletModelFromJson(json["wallets"]),
      transactions: transactionModelFromJson(json["transactions"]),
      userBalance: json["userBalance"],
    );
  }
}
