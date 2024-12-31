import 'package:flutter/material.dart';
import 'package:plantcare/models/care_schedule.dart';
import 'package:plantcare/services/firebase_service.dart';
import 'package:intl/intl.dart';

class AddScheduleScreen extends StatefulWidget {
  final String plantId;
  const AddScheduleScreen({super.key, required this.plantId});

  @override
  _AddScheduleScreenState createState() => _AddScheduleScreenState();
}

class _AddScheduleScreenState extends State<AddScheduleScreen> {
  final TextEditingController _actionController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _addSchedule() async {
    if (_selectedDate == null) return;

    final schedule = CareSchedule(
      id: DateTime.now().toString(),
      plantId: widget.plantId,
      action: _actionController.text,
      date: _selectedDate!,
    );
    await FirebaseService().addCareSchedule(schedule);
    Navigator.pop(context);
  }

  Future<void> _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Care Schedule'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _actionController,
              decoration: const InputDecoration(labelText: 'Care Action'),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  _selectedDate == null
                      ? 'No date selected'
                      : 'Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}',
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: _pickDate,
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addSchedule,
              child: const Text('Add Schedule'),
            ),
          ],
        ),
      ),
    );
  }
}
