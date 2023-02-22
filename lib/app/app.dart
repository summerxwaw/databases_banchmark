import 'package:benchmark_test/presentation/benchmark_widget.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "Benchmark",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                const SizedBox(height: 15),
                TabBar(
                  tabs: const [
                    Tab(text: "Read"),
                    Tab(text: "Write"),
                    Tab(text: "Delete"),
                  ],
                  labelColor: const Color(0xff7589a2),
                  controller: controller,
                  onTap: (index) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: 25),
                Expanded(
                  child:
                  BenchmarkWidget(BenchmarkType.values[controller.index]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}