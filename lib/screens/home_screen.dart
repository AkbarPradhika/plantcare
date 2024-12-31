import 'package:flutter/material.dart';
import 'package:plantcare/models/plant.dart';
import 'package:plantcare/services/firebase_service.dart';
import 'package:plantcare/screens/add_plant_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Plant> _plants = [];

  @override
  void initState() {
    super.initState();
    _loadPlants();
  }

  Future<void> _loadPlants() async {
    List<Plant> plants = await FirebaseService().getPlants();
    setState(() {
      _plants = plants;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PlantCare Assistant'),
      ),
      body: ListView.builder(
        itemCount: _plants.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_plants[index].name),
            subtitle: Text(_plants[index].type),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Navigate to edit screen (you can implement later)
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPlantScreen()),
          ).then((_) => _loadPlants()); // Reload plants list
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
