import 'package:flutter/material.dart';

import 'create_bulb.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool lighton = true;
  bool lightexists = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.white),
        title: const Text(
          "Smart Smart Lightbulbs",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[400],
      ),

      body: Center(
        child: Column(
          children: [
            lightexists
                ? LightCard(
                    title: "Bedroom Light",
                    isOn: lighton,
                    onToggle: (bool newval) {
                      setState(() {
                        lighton = newval;
                      });
                    },
                  )
                : CreateBulb(),
          ],
        ),
      ),
    );
  }
}

class LightCard extends StatefulWidget {
  final String title;
  final bool isOn;
  final ValueChanged<bool> onToggle;
  final VoidCallback? onSettingsTap;

  const LightCard({
    super.key,
    required this.title,
    required this.isOn,
    required this.onToggle,
    this.onSettingsTap,
  });

  @override
  State<LightCard> createState() => _LightCardState();
}

class _LightCardState extends State<LightCard> {
  bool _isExpanded = false;
  double brightness = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.isOn ? Colors.amber[600] : Colors.grey[600],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Bedroom Light",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Switch(
                value: widget.isOn,
                onChanged: widget.onToggle,
                activeThumbColor: Colors.white,
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      if (_isExpanded) {
                        _isExpanded = false;
                      } else {
                        _isExpanded = true;
                      }
                    });
                  },
                ),
              ),
            ],
          ),
          if (_isExpanded)
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Brightness: ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Slider(
                      value: brightness,
                      onChanged: (value) {
                        setState(() {
                          brightness = value;
                        });
                      },
                      thumbColor: Colors.white,
                      activeColor: Colors.amber,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Other Settings: ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class CreateBulb extends StatelessWidget {
  const CreateBulb({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Create a Lightbulb",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MakeBulb()),
            );
          },
          icon: Icon(Icons.add, color: Colors.white, size: 30),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(Colors.grey),
          ),
        ),
      ],
    );
  }
}
