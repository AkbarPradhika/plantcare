import 'package:flutter/material.dart';
import 'package:plantcare/models/plant.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;

  const PlantCard({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(plant.name),
        subtitle: Text(plant.type),
        onTap: () {
          // Navigate to plant details or edit page (implement later)
        },
      ),
    );
  }
}
