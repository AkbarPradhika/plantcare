import 'package:flutter/material.dart';
import 'package:plantcare/models/plant.dart';
import 'package:plantcare/services/firebase_service.dart';

class AddPlantScreen extends StatefulWidget {
  const AddPlantScreen({super.key});

  @override
  _AddPlantScreenState createState() => _AddPlantScreenState();
}

class _AddPlantScreenState extends State<AddPlantScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _careInfoController = TextEditingController();

  Future<void> _addPlant() async {
    final plant = Plant(
      id: DateTime.now().toString(),
      name: _nameController.text,
      type: _typeController.text,
      careInfo: _careInfoController.text,
    );
    await FirebaseService().addPlant(plant);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Plant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Plant Name'),
            ),
            TextField(
              controller: _typeController,
              decoration: const InputDecoration(labelText: 'Plant Type'),
            ),
            TextField(
              controller: _careInfoController,
              decoration: const InputDecoration(labelText: 'Care Information'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addPlant,
              child: const Text('Add Plant'),
            ),
          ],
        ),
      ),
    );
  }
}
