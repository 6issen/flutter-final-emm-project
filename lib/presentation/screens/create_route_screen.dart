import 'package:emm_final_project/domain/entities/route_entity.dart';
import 'package:emm_final_project/presentation/blocs/route/route_bloc.dart';
import 'package:emm_final_project/presentation/blocs/route/route_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class CreateRouteScreen extends StatefulWidget {
  const CreateRouteScreen({super.key});

  @override
  State<CreateRouteScreen> createState() => _CreateRouteScreenState();
}

class _CreateRouteScreenState extends State<CreateRouteScreen> {
  // Контроллеры для считывания текста из полей ввода
  final TextEditingController _partnerController = TextEditingController();
  final TextEditingController _meterController = TextEditingController();

  final List<String> _sections = [
    'Семей - Шар',
    'Шар - Аягоз',
    'Аягоз - Актогай',
    'Локальный маневр (депо)',
  ];

  final List<String> _locomotives = [
    '2ТЭ10М-0123',
    '3ТЭ10М-4567',
    'ТЭМ2-8899',
    'Эволюшн-5544',
  ];

  String? _selectedSection;
  String? _selectedLoco;

  DateTime _callDateTime = DateTime.now();
  DateTime _acceptDateTime = DateTime.now();

  Future<void> _pickDateTime(BuildContext context, bool isCallTime) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2026),
      lastDate: DateTime(2030),
    );

    if (pickedDate == null) return;

    if (!context.mounted) return;
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime == null) return;

    setState(() {
      final finalDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      if (isCallTime) {
        _callDateTime = finalDateTime;
      } else {
        _acceptDateTime = finalDateTime;
      }
    });
  }

  String _formatDT(DateTime dt) =>
      "${dt.day.toString().padLeft(2, '0')}.${dt.month.toString().padLeft(2, '0')} ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}";


  void _saveRouteAndStart() {
    // 1. Формируем объект (Entity) из введенных данных
    final newRoute = RouteEntity(
      locomotiveNumber: _selectedLoco ?? 'Не указан',
      section: _selectedSection ?? 'Не указан',
      partnerName: _partnerController.text.isNotEmpty ? _partnerController.text : 'Без напарника',
      callTime: _callDateTime,
      acceptTime: _acceptDateTime,
      startMeter: double.tryParse(_meterController.text) ?? 0.0,
    );

    // 2. Отправляем событие в BLoC для сохранения в БД Drift
    context.read<RouteBloc>().add(CreateRouteEvent(newRoute));

    // 3. Возвращаемся на главный экран, чтобы увидеть созданный маршрут в списке
    context.go('/home');
  }

  @override
  void dispose() {
    _partnerController.dispose();
    _meterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Новая явка')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Основная информация',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Выберите локомотив',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.train),
              ),
              initialValue: _selectedLoco,
              items: _locomotives.map((String value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              )).toList(),
              onChanged: (val) => setState(() => _selectedLoco = val),
            ),
            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Выберите участок',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.map),
              ),
              initialValue: _selectedSection,
              items: _sections.map((String value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              )).toList(),
              onChanged: (val) => setState(() => _selectedSection = val),
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _partnerController, // Подключили контроллер
              decoration: const InputDecoration(
                labelText: 'ФИО Напарника',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_add),
              ),
            ),

            const SizedBox(height: 24),
            const Text('Временные отметки',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            ListTile(
              title: const Text('Дата и время явки'),
              subtitle: Text(_formatDT(_callDateTime)),
              leading: const Icon(Icons.access_time),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              onTap: () => _pickDateTime(context, true),
            ),
            const SizedBox(height: 12),

            ListTile(
              title: const Text('Прием локомотива'),
              subtitle: Text(_formatDT(_acceptDateTime)),
              leading: const Icon(Icons.handyman),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              onTap: () => _pickDateTime(context, false),
            ),

            const SizedBox(height: 24),
            const Text('Показания счетчиков (Прием)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            TextFormField(
              controller: _meterController, // Подключили контроллер
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Электроэнергия / Топливо (прием)',
                suffixText: 'кВт/ч (л)',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 32),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              ),
              onPressed: _saveRouteAndStart, // Вызываем функцию сохранения
              icon: const Icon(Icons.play_arrow),
              label: const Text('Начать маршрут'),
            ),
          ],
        ),
      ),
    );
  }
}