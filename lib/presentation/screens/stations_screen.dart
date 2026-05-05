import 'package:emm_final_project/domain/entities/station_entity.dart';
import 'package:emm_final_project/presentation/blocs/station/station_bloc.dart';
import 'package:emm_final_project/presentation/blocs/station/station_event.dart';
import 'package:emm_final_project/presentation/blocs/station/station_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';



class StationsScreen extends StatefulWidget {
  final int routeId; // ID маршрута, который мы передали с главного экрана

  const StationsScreen({super.key, required this.routeId});

  @override
  State<StationsScreen> createState() => _StationsScreenState();
}

class _StationsScreenState extends State<StationsScreen> {
  @override
  void initState() {
    super.initState();
    // Как только экран открывается, просим BLoC загрузить станции для этого маршрута
    context.read<StationBloc>().add(LoadStationsEvent(widget.routeId));
  }

  // Диалоговое окно для добавления новой станции
  void _showAddStationDialog() {
    final nameController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            left: 16, right: 16, top: 16
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Добавить станцию', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Название станции',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.business),
              ),
              autofocus: true,
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  // Создаем сущность станции
                  final newStation = StationEntity(
                    routeId: widget.routeId, // Привязываем к текущему маршруту!
                    name: nameController.text,
                    // Для MVP: чтобы не перегружать интерфейс выбором времени,
                    // пока ставим текущее время прибытия и +20 минут на отправление
                    arrivalTime: DateTime.now(),
                    departureTime: DateTime.now().add(const Duration(minutes: 20)),
                  );

                  // Отправляем событие в BLoC на сохранение в БД
                  context.read<StationBloc>().add(AddStationEvent(newStation));

                  // Закрываем шторку
                  Navigator.pop(context);
                }
              },
              child: const Text('СОХРАНИТЬ'),
            ),
          ],
        ),
      ),
    );
  }

  // Вспомогательная функция для красивого формата времени
  String _formatTime(DateTime dt) =>
      "${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Движение по станциям'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_circle_outline, color: Colors.green),
            onPressed: () => context.go('/details', extra: widget.routeId),
            tooltip: 'Завершить маршрут',
          ),
        ],
      ),
      body: BlocBuilder<StationBloc, StationState>(
        builder: (context, state) {
          if (state is StationLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (state is StationErrorState) {
            return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
          }
          else if (state is StationLoadedState) {
            final stations = state.stations;

            if (stations.isEmpty) {
              return const Center(
                child: Text('Нет станций. Нажмите + для добавления.'),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: stations.length,
              itemBuilder: (context, index) {
                final station = stations[index];

                return Dismissible(
                  key: ValueKey(station.id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(12)),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(Icons.delete_outline, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    // Удаляем станцию из базы через BLoC
                    context.read<StationBloc>().add(DeleteStationEvent(station.id!, widget.routeId));
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(child: Text('${index + 1}')),
                      title: Text(station.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('Приб: ${_formatTime(station.arrivalTime)} | Отпр: ${_formatTime(station.departureTime)}'),
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddStationDialog,
        label: const Text('Станция'),
        icon: const Icon(Icons.add_location_alt),
      ),
    );
  }
}