class RouteEntity {
  final int? id; // ID может быть null до сохранения в базу
  final String locomotiveNumber; // Номер локомотива
  final String section;          // Участок
  final String partnerName;      // ФИО напарника
  final DateTime callTime;       // Время явки
  final DateTime acceptTime;     // Время приема локомотива
  final DateTime? releaseTime;   // Время сдачи (null, пока маршрут не завершен)
  final double startMeter;       // Показания счетчика при приеме
  final double? endMeter;        // Показания счетчика при сдаче

  RouteEntity({
    this.id,
    required this.locomotiveNumber,
    required this.section,
    required this.partnerName,
    required this.callTime,
    required this.acceptTime,
    this.releaseTime,
    required this.startMeter,
    this.endMeter,
  });

  double? get totalConsumption {
    if (endMeter != null) {
      return endMeter! - startMeter;
    }
    return null;
  }
}