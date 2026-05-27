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

  /// Mime type of the file.
  /// i.e. image/jpeg, video/mp4, text/plain
  final String? mimeType;

  /// Post message iOS ONLY
  final String? message;

  SharedFile({
    required this.value,
    this.action,
    this.thumbnail,
    this.duration,
    this.type = SharedMediaType.OTHER,
    this.mimeType,
    this.message,
  });

  SharedFile.fromJson(Map<String, dynamic> json)
    : value = json['value'] ?? json['value'],
      action = json['action'],
      thumbnail = json['thumbnail'],
      duration = json['duration'],
      type = json['type'] is int
          ? SharedMediaType.values[json['type']]
          : SharedMediaType.OTHER,
      mimeType = json['mimeType'],
      message = json['message'];

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'thumbnail': thumbnail,
      'duration': duration,
      'type': type.index,
      'mimeType': mimeType,
      'message': message,
    };
  }

  @override
  String toString() {
    return "{ action:$action, value:$value, thumbnail:$thumbnail, duration:$duration, type:$type, mimeType:$mimeType, message:$message }";
  }

  bool get isView => IntentActionType.isView(action);

  bool get isSend => IntentActionType.isSend(action);
}

enum SharedMediaType { TEXT, URL, IMAGE, VIDEO, FILE, WEB_SEARCH, OTHER }

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
