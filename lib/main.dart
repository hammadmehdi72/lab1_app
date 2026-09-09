import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Stores the current counter value displayed in the middle of the screen.
  // It is mutable, so it belongs in the State class instead of the widget.
  int _counter = 0;

  // Increases the counter when the plus button is pressed.
  void _incrementCounter() {
    // setState tells Flutter that the value changed and the screen must rebuild.
    setState(() {
      // The ++ operator adds one to the current counter value.
      _counter++;
    });
  }

  // Decreases the counter when the minus button is pressed.
  void _decrementCounter() {
    setState(() {
      // The -- operator subtracts one from the current counter value.
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // Places the column's children in the vertical center of the screen.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gives the user context for the number shown below.
            const Text('You have pushed the button this many times:'),
            // Row places the counter number and the star icon side by side.
            Row(
              // Centers both children horizontally inside the row.
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Converts the current counter value to text for display.
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                // Adds space so the number and icon do not touch.
                const SizedBox(width: 8),
                // Adds a visual star beside the counter value.
                const Icon(Icons.star, color: Colors.amber),
              ],
            ),
            // Provides an instruction below the counter using a custom style.
            const Text(
              'Keep tapping!',
              // Makes this instruction larger, italic, and gray.
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      // A row allows the decrement and increment buttons to appear together.
      floatingActionButton: Row(
        // Keeps the row as small as its two buttons require.
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            // Connects the minus button to the decrement method.
            onPressed: _decrementCounter,
            // Describes the button for accessibility and long-press hints.
            tooltip: 'Decrement',
            // Displays the minus symbol inside the button.
            child: const Icon(Icons.remove),
          ),
          // Separates the two floating action buttons.
          const SizedBox(width: 12),
          FloatingActionButton(
            // Connects the plus button to the increment method.
            onPressed: _incrementCounter,
            // Describes the button for accessibility and long-press hints.
            tooltip: 'Increment',
            // Displays the plus symbol inside the button.
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
