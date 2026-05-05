class StationEntity {
  final int? id;
  final int routeId;           // К какому маршруту относится станция
  final String name;           // Название станции
  final DateTime arrivalTime;  // Время прибытия
  final DateTime departureTime;// Время отправления

  StationEntity({
    this.id,
    required this.routeId,
    required this.name,
    required this.arrivalTime,
    required this.departureTime,
  });

  Duration get parkingDuration {
    return departureTime.difference(arrivalTime);
  }
}