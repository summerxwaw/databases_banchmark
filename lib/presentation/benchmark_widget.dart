import 'package:benchmark_test/benchmark.dart';
import 'package:benchmark_test/presentation/benchmark_result.dart';
import 'package:flutter/material.dart';

enum BenchmarkType { read, write, delete }

class BenchmarkWidget extends StatefulWidget {
  final BenchmarkType type;

  const BenchmarkWidget(this.type, {super.key});

  @override
  State<BenchmarkWidget> createState() => _BenchmarkWidgetState();
}

class _BenchmarkWidgetState extends State<BenchmarkWidget> {
  static const entrySteps = [10, 20, 50, 100, 200, 500, 1000];

  var entryValue = 0.0;

  int get entries => entrySteps[entryValue.round()];

  var benchmarkRunning = false;
  List<Result>? benchmarkResults;

  @override
  void didChangeDependencies() {
    benchmarkResults = null;
    benchmarkRunning = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (benchmarkResults == null)
          const Expanded(
            child: Center(
              child: Text('Run benchmark to show data'),
            ),
          )
        else
          Expanded(
            child: Center(
              child: BenchmarkResult(benchmarkResults!),
            ),
          ),
        const SizedBox(height: 20),
        Row(
          children: <Widget>[
            Expanded(
              child: Slider(
                value: entryValue,
                min: 0,
                max: (entrySteps.length - 1).toDouble(),
                divisions: entrySteps.length - 2,
                onChanged: (newValue) {
                  setState(() {
                    entryValue = newValue;
                  });
                },
              ),
            ),
            SizedBox(
              width: 80,
              child: Text("${entries.toString()} Entries"),
            ),
          ],
        ),
        if (benchmarkRunning)
          const Center(
            child: SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(strokeWidth: 3),
            ),
          )
        else
          Center(
            child: ElevatedButton(
              onPressed: _performBenchmark,
              child: const Text("Benchmark"),
            ),
          ),
        const SizedBox(height: 20),
      ],
    );
  }

  _performBenchmark() async {
    var entries = this.entries;
    setState(() {
      benchmarkRunning = true;
    });

    List<Result> results;
    switch (widget.type) {
      case BenchmarkType.read:
        results = await benchmarkRead(entries);
        break;
      case BenchmarkType.write:
        results = await benchmarkWrite(entries);
        break;
      case BenchmarkType.delete:
        results = await benchmarkDelete(entries);
        break;
    }

    setState(() {
      benchmarkRunning = false;
      benchmarkResults = results;
    });
  }
}
