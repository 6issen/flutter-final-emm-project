import 'package:emm_final_project/domain/entities/route_entity.dart';
import 'package:emm_final_project/presentation/blocs/route/route_bloc.dart';
import 'package:emm_final_project/presentation/blocs/route/route_event.dart';
import 'package:emm_final_project/presentation/blocs/route/route_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class RouteDetailsScreen extends StatefulWidget {
  final int routeId;

  const RouteDetailsScreen({super.key, required this.routeId});

  @override
  State<RouteDetailsScreen> createState() => _RouteDetailsScreenState();
}

class _RouteDetailsScreenState extends State<RouteDetailsScreen> {
  final _endMeterController = TextEditingController();

  @override
  void dispose() {
    _endMeterController.dispose();
    super.dispose();
  }

  // Красивое форматирование даты
  String _formatDT(DateTime dt) => 
      "${dt.day.toString().padLeft(2, '0')}.${dt.month.toString().padLeft(2, '0')} ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}";

  void _finishRoute(RouteEntity currentRoute) {
    if (_endMeterController.text.isEmpty) return;

    final endMeter = double.tryParse(_endMeterController.text) ?? 0.0;

    final updatedRoute = RouteEntity(
      id: currentRoute.id,
      locomotiveNumber: currentRoute.locomotiveNumber,
      section: currentRoute.section,
      partnerName: currentRoute.partnerName,
      callTime: currentRoute.callTime,
      acceptTime: currentRoute.acceptTime,
      releaseTime: DateTime.now(), 
      startMeter: currentRoute.startMeter,
      endMeter: endMeter, 
    );

    // 1. Отправляем данные в базу через BLoC
    context.read<RouteBloc>().add(UpdateRouteEvent(updatedRoute));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/home'),
        ),
        title: const Text('Детали маршрута'),
        actions: [
          BlocBuilder<RouteBloc, RouteState>(
            builder: (context, state) {
              if (state is RouteLoadedState) {
                try {
                  final route = state.routes.firstWhere((r) => r.id == widget.routeId);
                  // Не разрешаем редактировать уже завершенные маршруты
                  if (route.releaseTime == null) {
                    return IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _showEditDialog(context, route),
                    );
                  }
                } catch (_) {}
              }
              return const SizedBox.shrink();
            },
          ),
        ],
        ),
        
      body: BlocBuilder<RouteBloc, RouteState>(
        builder: (context, state) {
          if (state is RouteLoadedState) {
            // Ищем наш маршрут в списке загруженных по ID
            try {
              final route = state.routes.firstWhere((r) => r.id == widget.routeId);
              
              final isFinished = route.releaseTime != null;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Локомотив: ${route.locomotiveNumber}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            const Divider(),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(Icons.map),
                              title: const Text('Участок'),
                              subtitle: Text(route.section),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(Icons.person),
                              title: const Text('Напарник'),
                              subtitle: Text(route.partnerName),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(Icons.access_time),
                              title: const Text('Время явки'),
                              subtitle: Text(_formatDT(route.callTime)),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(Icons.speed),
                              title: const Text('Счетчик (прием)'),
                              subtitle: Text('${route.startMeter}'),
                            ),
                            // Кнопка для перехода к списку станций
                            OutlinedButton.icon(
                              onPressed: () => context.push('/stations', extra: route.id),
                              icon: const Icon(Icons.location_on),
                              label: const Text('Станции и остановки'),
                              style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(40)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Если маршрут еще не завершен — показываем форму завершения
                    if (!isFinished) ...[
                      const Text('Завершение поездки', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _endMeterController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Показания счетчика (сдача)',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.speed),
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Colors.green.shade100,
                        ),
                        onPressed: () => _finishRoute(route),
                        icon: const Icon(Icons.check_circle, color: Colors.green),
                        label: const Text('ЗАВЕРШИТЬ МАРШРУТ', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                      ),
                    ] else ...[
                      // Если маршрут уже завершен
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          children: [
                            const Icon(Icons.check_circle, color: Colors.green, size: 48),
                            const SizedBox(height: 8),
                            const Text('Поездка успешно завершена', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                            const Divider(),
                            Text('Счетчик при сдаче: ${route.endMeter}'),
                            Text('Время сдачи: ${_formatDT(route.releaseTime!)}'),
                            const SizedBox(height: 8),
                            Text(
                              'Расход: ${((route.endMeter ?? 0) - route.startMeter).toStringAsFixed(1)}', 
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                            ),
                          ],
                        ),
                      ),
                    ]
                  ],
                ),
              );
            } catch (e) {
              return const Center(child: Text('Маршрут не найден'));
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
  // Диалоговое окно для редактирования
  void _showEditDialog(BuildContext context, RouteEntity route) {
    // Контроллеры с уже заполненными текущими данными
    final locoCtrl = TextEditingController(text: route.locomotiveNumber);
    final partnerCtrl = TextEditingController(text: route.partnerName);
    final sectionCtrl = TextEditingController(text: route.section);

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Редактировать маршрут'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: locoCtrl,
                  decoration: const InputDecoration(labelText: 'Номер локомотива'),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: sectionCtrl,
                  decoration: const InputDecoration(labelText: 'Участок'),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: partnerCtrl,
                  decoration: const InputDecoration(labelText: 'ФИО напарника'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('ОТМЕНА'),
            ),
            ElevatedButton(
              onPressed: () {
                // Создаем обновленную копию маршрута
                final updatedRoute = RouteEntity(
                  id: route.id,
                  locomotiveNumber: locoCtrl.text,
                  section: sectionCtrl.text,
                  partnerName: partnerCtrl.text, // Обновленные поля
                  
                  // Старые поля оставляем без изменений
                  callTime: route.callTime,
                  acceptTime: route.acceptTime,
                  releaseTime: route.releaseTime,
                  startMeter: route.startMeter,
                  endMeter: route.endMeter,
                );

                // Отправляем в BLoC на сохранение
                context.read<RouteBloc>().add(UpdateRouteEvent(updatedRoute));
                
                // Закрываем диалог
                Navigator.pop(dialogContext);
              },
              child: const Text('СОХРАНИТЬ'),
            ),
          ],
        );
      },
    );
  }
}