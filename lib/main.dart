import 'package:flutter/material.dart';

import 'detailscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Parking App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainScreen(),
    );
  }
}

class Vehicle {
  final String name;
  final String vehicleNumber;

  Vehicle(this.name, this.vehicleNumber);
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _vehicleNumberController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  List<Vehicle> _vehicles = [];
  List<Vehicle> _filteredVehicles = [];

  void _addVehicle() {
    final String name = _nameController.text;
    final String vehicleNumber = _vehicleNumberController.text;

    if (name.isNotEmpty && vehicleNumber.isNotEmpty) {
      setState(() {
        _vehicles.add(Vehicle(name, vehicleNumber));
        _filteredVehicles.add(Vehicle(name, vehicleNumber));
        _nameController.clear();
        _vehicleNumberController.clear();
      });
    }
  }

  void _searchVehicles(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredVehicles = List.from(_vehicles);
      } else {
        _filteredVehicles = _vehicles
            .where((vehicle) =>
            vehicle.vehicleNumber.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // Initialize with an empty list
    _filteredVehicles = List.from(_vehicles);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Car Parking App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(labelText: 'Search Vehicle Number'),
              onChanged: _searchVehicles,
            ),
            const SizedBox(height: 20),
            // Input Fields
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Vehicle Name'),
            ),
            TextField(
              controller: _vehicleNumberController,
              decoration: const InputDecoration(labelText: 'Vehicle Number'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addVehicle,
              child: const Text('Add Vehicle'),
            ),
            const SizedBox(height: 20),
            // Display List of Vehicles
            Expanded(
              child: ListView.builder(
                itemCount: _filteredVehicles.length,
                itemBuilder: (ctx, i) {
                  final vehicle = _filteredVehicles[i];
                  return ListTile(
                    title: Text(vehicle.name),
                    subtitle: Text(vehicle.vehicleNumber),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(name: vehicle.name, vehicleNumber: vehicle.vehicleNumber),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

