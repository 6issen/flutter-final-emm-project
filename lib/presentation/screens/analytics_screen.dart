import 'package:emm_final_project/presentation/blocs/route/route_bloc.dart';
import 'package:emm_final_project/presentation/blocs/route/route_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';


class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Статистика расходов'),
        centerTitle: true,
      ),
      body: BlocBuilder<RouteBloc, RouteState>(
        builder: (context, state) {
          if (state is RouteLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } 
          else if (state is RouteErrorState) {
            return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
          } 
          else if (state is RouteLoadedState) {
            final finishedRoutes = state.routes
                .where((r) => r.releaseTime != null && r.endMeter != null)
                .toList();
            if (finishedRoutes.isEmpty) {
              return const Center(
                child: Text('Нет данных для статистики.\nЗавершите хотя бы одну поездку.'),
              );
            }

            //СЧИТАЕМ СРЕДНИЙ РАСХОД ЗА ВСЕ ВРЕМЯ
            double totalConsumption = 0;
            for (var route in finishedRoutes) {
              totalConsumption += (route.endMeter! - route.startMeter);
            }
            final averageConsumption = totalConsumption / finishedRoutes.length;

            final recentRoutes = finishedRoutes.length > 7 
                ? finishedRoutes.sublist(finishedRoutes.length - 7) 
                : finishedRoutes;
            
            final barGroups = List.generate(recentRoutes.length, (index) {
              final route = recentRoutes[index];
              final consumption = route.endMeter! - route.startMeter;
              return BarChartGroupData(
                x: index, 
                barRods: [BarChartRodData(toY: consumption, color: Colors.blue, width: 16)]
              );
            });

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Расход (кВт/ч или литры)',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 32),

                  // График
                  AspectRatio(
                    aspectRatio: 1.5,
                    child: BarChart(
                      BarChartData(
                        borderData: FlBorderData(show: false),
                        titlesData: const FlTitlesData(
                          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 40)),
                          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        ),
                        barGroups: barGroups,
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),
                  
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.bolt, color: Colors.orange),
                      title: const Text('Средний расход за всё время'),
                      trailing: Text(
                        '${averageConsumption.toStringAsFixed(1)} ед.', 
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
