import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Meri Pehli UI',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String message = 'Hello Flutter Web! 😎';
  int clicks = 0;
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onButtonPressed() {
    setState(() {
      clicks++;
      message = 'Button dabaya gaya $clicks baar';
    });
    // debug console me bhi print karna chahe to:
    // print('Button pressed: $clicks');
  }

  void _submitText() {
    final text = _controller.text.trim();
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kuch likho pehle')),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tumne likha: $text')),
    );
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meri Pehli UI')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              child: Icon(Icons.person, size: 40),
            ),
            const SizedBox(height: 12),
            Text(message, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _onButtonPressed, child: const Text('Click Me')),
            const SizedBox(height: 20),

            // Simple input field + submit
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Kuch likho',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: ElevatedButton(onPressed: _submitText, child: const Text('Submit'))),
              ],
            ),

            const SizedBox(height: 24),
            // Few cards to show list-like content (no need to declare assets)
            Column(
              children: List.generate(3, (i) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    leading: CircleAvatar(child: Text('${i + 1}')),
                    title: Text('Item ${i + 1}'),
                    subtitle: const Text('Ye ek example item hai.'),
                    trailing: IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
