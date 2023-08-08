class AppNotification {
  String title;
  String details;
  String img = '';
  DateTime timeStamp;
  String president;
  String type;

  AppNotification({
    required this.title,
    required this.details,
    required this.president,
    required this.timeStamp,
    required this.type,
    this.img = '',
  });
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'details': details,
      'img': img,
      'timeStamp': timeStamp,
      'president': president,
      'type': type,
    };
  }
}
