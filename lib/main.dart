import 'package:flutter/material.dart';

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
            LightCard(
              title: "Bedroom Light",
              isOn: lighton,
              onToggle: (bool newval) {
                setState(() {
                  lighton = newval;
                });
              },
            ),
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
                      activeColor: Colors.grey,
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
