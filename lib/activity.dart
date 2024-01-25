/// The response of the `GET /api/activity` endpoint.
///
/// It is defined using `freezed` and `json_serializable`.

class Activity {
  final String key;
  final String activity;
  final String type;
  final int participants;
  final double price;

  const Activity({
    required this.key,
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
  });

  // Activity copyWith({
  //   String? key,
  //   String? activity,
  //   String? type,
  //   int? participants,
  //   double? price,
  // }) {
  //   return Activity(
  //     key: key ?? this.key,
  //     activity: activity ?? this.activity,
  //     type: type ?? this.type,
  //     participants: participants ?? this.participants,
  //     price: price ?? this.price,
  //   );
  // }

  static Activity fromJson(Map<String, Object?> json) => Activity(
      key: json['key'] as String,
      activity: json['activity'] as String,
      type: json['type'] as String,
      participants: json['participants'] as int,
      price: json['price'] as double);

  /// Convert a JSON object into an [Activity] instance.
  /// This enables type-safe reading of the API response.
  // factory Activity.fromJson(Map<String, dynamic> json) => _$ActivityFromJson(json);
}
