import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Freezed Bloc'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
            child: Text(
              state.when(initial: () => '0', running: (number) => '$number'),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          onPressed: () {
            BlocProvider.of<CounterBloc>(context)
                .add(const CounterEvent.incerement());
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        const SizedBox(
          width: 10,
        ),
        FloatingActionButton(
          onPressed: () {
            BlocProvider.of<CounterBloc>(context)
                .add(const CounterEvent.decerement());
          },
          tooltip: 'decrement',
          child: const Icon(Icons.remove),
        ),
      ]),
      // Column(
      //   children: [
      //     ElevatedButton(
      //         onPressed: () {
      //           context
      //               .read<CounterBloc>()
      //               .add(const CounterEvent.incerement());
      //         },
      //         child: const Text('increment')),
      //     ElevatedButton(
      //         onPressed: () {
      //           context
      //               .read<CounterBloc>()
      //               .add(const CounterEvent.decerement());
      //         },
      //         child: const Text('decrement')),
      //   ],
      // )
    );
  }
}
