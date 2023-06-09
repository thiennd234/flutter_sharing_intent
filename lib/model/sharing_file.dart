// ignore_for_file: constant_identifier_names

class SharedFile {
  /// Image or Video path or text
  /// NOTE. for iOS only the file is always copied
  String? value;

  /// Action for android
  String? action;

  /// Video thumbnail
  String? thumbnail;

  /// Video duration in milliseconds
  int? duration;

  /// Whether its a video or image or file
  SharedMediaType type = SharedMediaType.OTHER;

  SharedFile({
    required this.value,
    this.action,
    this.thumbnail,
    this.duration,
    this.type = SharedMediaType.OTHER,
  });

  SharedFile.fromJson(Map<String, dynamic> json)
      : value = json['value'],
        action = json['action'],
        thumbnail = json['thumbnail'],
        duration = json['duration'],
        type = SharedMediaType.values[json['type']];

  @override
  String toString() {
    return "{ action:$action, value:$value, thumbnail:$thumbnail, duration:$duration, type:$type }";
  }

  bool get isView => IntentActionType.isView(action);

  bool get isSend => IntentActionType.isSend(action);
}

enum SharedMediaType { TEXT, URL, IMAGE, VIDEO, FILE, OTHER }

enum IntentActionType {
  view('android.intent.action.VIEW'),
  send('android.intent.action.SEND'),
  sendMultiple('android.intent.action.SEND_MULTIPLE');

  final String value;
  const IntentActionType(this.value);

  static bool isView(action) => [view.value].contains(action);

  static bool isSend(action) =>
      [send.value, sendMultiple.value].contains(action);
}
