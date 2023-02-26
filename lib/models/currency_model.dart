List<CurrencyModel> currencyModelFromJson(data) =>
    List<CurrencyModel>.from(data.map((x) => CurrencyModel.fromJson(x)));

class CurrencyModel {
  int id;
  int isDefault;
  String symbol;
  String code;
  String currName;
  int type;
  int status;
  String rate;

  CurrencyModel({
    required this.id,
    required this.isDefault,
    required this.symbol,
    required this.code,
    required this.currName,
    required this.type,
    required this.status,
    required this.rate,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
        id: json["id"],
        isDefault: json["is_default"],
        symbol: json["symbol"],
        code: json["code"],
        currName: json["curr_name"],
        type: json["type"],
        status: json["status"],
        rate: json["rate"]);
  }
}
