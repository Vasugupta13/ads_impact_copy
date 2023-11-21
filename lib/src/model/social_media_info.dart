import 'dart:convert';

class SocialMediaInfo {
  final String name;
  final String amount;
  final String daysamount;
  final String percentage;
  final String imageurl;
  SocialMediaInfo({
    required this.name,
    required this.amount,
    required this.daysamount,
    required this.percentage,
    required this.imageurl,
  });

  SocialMediaInfo copyWith({
    String? name,
    String? amount,
    String? daysamount,
    String? percentage,
    String? imageurl,
  }) {
    return SocialMediaInfo(
      name: name ?? this.name,
      amount: amount ?? this.amount,
      daysamount: daysamount ?? this.daysamount,
      percentage: percentage ?? this.percentage,
      imageurl: imageurl ?? this.imageurl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'amount': amount,
      'daysamount': daysamount,
      'percentage': percentage,
      'imageurl': imageurl,
    };
  }

  factory SocialMediaInfo.fromMap(Map<String, dynamic> map) {
    return SocialMediaInfo(
      name: map['name'] as String,
      amount: map['amount'] as String,
      daysamount: map['daysamount'] as String,
      percentage: map['percentage'] as String,
      imageurl: map['imageurl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialMediaInfo.fromJson(String source) =>
      SocialMediaInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SocialMediaInfo(name: $name, amount: $amount, daysamount: $daysamount, percentage: $percentage, imageurl: $imageurl)';
  }

  @override
  bool operator ==(covariant SocialMediaInfo other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.amount == amount &&
        other.daysamount == daysamount &&
        other.percentage == percentage &&
        other.imageurl == imageurl;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        amount.hashCode ^
        daysamount.hashCode ^
        percentage.hashCode ^
        imageurl.hashCode;
  }
}

class SocialMediaResponse {
  final List<SocialMediaInfo> data;
  SocialMediaResponse({
    required this.data,
  });

  factory SocialMediaResponse.fromMap(Map<String, dynamic> map) {
    return SocialMediaResponse(
        data: (map['data'] as List<dynamic>)
            .map((e) => SocialMediaInfo(
                  name: e['name'],
                  daysamount: e['daysamount'],
                  amount: e['amount'],
                  imageurl: e['imageurl'],
                  percentage: e['percentage'],
                ))
            .toList());
  }

  factory SocialMediaResponse.fromJson(String source) =>
      SocialMediaResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
