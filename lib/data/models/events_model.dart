class EventsModel {
  final int id;
  final String name;
  final String description;
  final String createdAt;
  final String location;
  final int colorValue;
  final String eventDate;

  EventsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.location,
    required this.colorValue,
    required this.eventDate,
  });
  EventsModel.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        name = res['name'],
        description = res['description'],
        createdAt = res['createdAt'],
        location = res['location'],
        colorValue = res['colorValue'],
        eventDate = res['eventDate'];
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'createdAt': createdAt,
      'location': location,
      'colorValue': colorValue,
      'eventDate': eventDate
    };
  }
}
