import 'package:flutter/material.dart';

import 'fulldetail_screen.dart';

class DetailsScreen extends StatelessWidget {
  final String name;
  final String vehicleNumber;

  const DetailsScreen({super.key, required this.name, required this.vehicleNumber});

  void _navigateToFullDetails(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FullDetailsScreen(name: name, vehicleNumber: vehicleNumber),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vehicle Details')),
      body: Center(
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(16),
          child: InkWell(
            onTap: () => _navigateToFullDetails(context),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Name: $name', style: const TextStyle(fontSize: 20)),
                  Text('Vehicle Number: $vehicleNumber', style: const TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}