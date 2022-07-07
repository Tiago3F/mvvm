import 'package:flutter/material.dart';
import 'package:mvvm/src/home/home_controller.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculo IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: controller.setAltura,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Altura'),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: controller.setPeso,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Peso'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: controller.calculateImc,
                child: const Text('Calcular')),
            const SizedBox(height: 10),
            RxBuilder(builder: (_) => Text(controller.result))
          ],
        ),
      ),
    );
  }
}
