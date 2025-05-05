class EventEntity {
  final String id;
  final String departamentId;
  final String title;
  final DateTime startTime;
  final DateTime endTime;
  final String classWhereHeld;
  final String supporterName;

  EventEntity({
    required this.id,
    required this.departamentId,
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.classWhereHeld,
    required this.supporterName,
  });
}
