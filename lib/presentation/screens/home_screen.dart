import 'package:emm_final_project/domain/entities/route_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:emm_final_project/presentation/blocs/route/route_bloc.dart';
import 'package:emm_final_project/presentation/blocs/route/route_event.dart';
import 'package:emm_final_project/presentation/blocs/route/route_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Мои маршруты'),
          centerTitle: true,
          // Добавляем панель с вкладками
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Все'),
              Tab(text: 'В пути'),
              Tab(text: 'Завершенные'),
            ],
          ),
        ),
        body: BlocBuilder<RouteBloc, RouteState>(
          builder: (context, state) {
            if (state is RouteLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is RouteErrorState) {
              return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
            } else if (state is RouteLoadedState) {
              
              // 1. Подготавливаем отфильтрованные списки
              final allRoutes = state.routes;
              final activeRoutes = allRoutes.where((r) => r.releaseTime == null).toList();
              final finishedRoutes = allRoutes.where((r) => r.releaseTime != null).toList();

              // 2. TabBarView перелистывает экраны синхронно с вкладками
              return TabBarView(
                children: [
                  _buildRoutesList(context, allRoutes),
                  _buildRoutesList(context, activeRoutes),
                  _buildRoutesList(context, finishedRoutes),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
        // Кнопка создания нового маршрута (если у тебя путь в роутере другой — поправь)
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.push('/create_route'),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  // Вспомогательный метод для отрисовки самого списка
  Widget _buildRoutesList(BuildContext context, List<RouteEntity> routes) {
    if (routes.isEmpty) {
      return const Center(
        child: Text('В этой категории нет маршрутов', style: TextStyle(color: Colors.grey)),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: routes.length,
      itemBuilder: (context, index) {
        final route = routes[index];
        final isFinished = route.releaseTime != null;

        // Оборачиваем в Dismissible для удаления свайпом (как мы делали раньше)
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Dismissible(
            key: ValueKey(route.id),
            direction: DismissDirection.endToStart,
            background: Container(
              // Заменяем просто color на decoration, чтобы добавить закругление углов
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12), // Закругление как у карточки
              ),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (_) {
              context.read<RouteBloc>().add(DeleteRouteEvent(route.id!));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Маршрут удален')),
              );
            },
            child: Card(
              // Убираем margin у карточки, так как мы вынесли его в Padding выше
              margin: EdgeInsets.zero,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: isFinished ? Colors.green.shade100 : Colors.blue.shade100,
                  child: Icon(
                    isFinished ? Icons.check_circle : Icons.train,
                    color: isFinished ? Colors.green : Colors.blue,
                  ),
                ),
                title: Text('Локомотив: ${route.locomotiveNumber}', style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Участок: ${route.section}\nНапарник: ${route.partnerName}'),
                trailing: const Icon(Icons.chevron_right),
                isThreeLine: true,
                onTap: () {
                  context.push('/details', extra: route.id);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}