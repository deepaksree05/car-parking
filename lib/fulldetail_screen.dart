import 'package:flutter/material.dart';
class FullDetailsScreen extends StatelessWidget {
  final String name;
  final String vehicleNumber;

  FullDetailsScreen({super.key, required this.name, required this.vehicleNumber});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    double hourlyRate = 10.0; // Example hourly rate
    int parkedHours = now.hour; // Example calculation for parked hours
    double totalAmount = parkedHours * hourlyRate;

    return Scaffold(
      appBar: AppBar(title: const Text('Full Vehicle Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Vehicle Name: $name', style: const TextStyle(fontSize: 20)),
            Text('Vehicle Number: $vehicleNumber', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Text('Date & Time of Entry:', style: const TextStyle(fontSize: 18)),
            Text('${now.toLocal()}'.split(' ')[0], style: const TextStyle(fontSize: 16)), // Date
            Text('${now.hour}:${now.minute.toString().padLeft(2, '0')}', style: const TextStyle(fontSize: 16)), // Time
            const SizedBox(height: 20),
            Text('Parked Hours:', style: const TextStyle(fontSize: 18)),
            Text('$parkedHours hours', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            Text('Total Amount:', style: const TextStyle(fontSize: 18)),
            Text('\$${totalAmount.toStringAsFixed(2)}', style:
            const TextStyle(fontSize:
            24, fontWeight:
            FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}