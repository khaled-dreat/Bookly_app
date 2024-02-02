import 'dart:developer';

class ListPrice {
  double? amount;
  String? currencyCode;

  ListPrice({this.amount, this.currencyCode});

  factory ListPrice.fromJson(Map<String, dynamic> json) {
    log(name: "Json List Prise", json.toString());
    dynamic jsonData;

    try {
      final listPrice = ListPrice.fromJson(jsonData);
      log(
          name: "Amount value",
          listPrice.amount.toString()); // قيمة amount بعد التحويل
      log(
          name: "Currency Code value",
          listPrice.currencyCode.toString()); // قيمة currencyCode بعد التحويل
    } catch (e) {
      log(
          name: "Error in List Prise",
          'حدث خطأ: $e'); // طباعة أي استثناءات تحدث
    }
    return ListPrice(
      amount: (json['amount'] as num?)?.toDouble(),
      currencyCode: json['currencyCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'currencyCode': currencyCode,
      };
}
