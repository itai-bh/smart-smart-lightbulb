import 'package:flutter/material.dart';

class MakeBulb extends StatefulWidget {
  const MakeBulb({super.key});

  @override
  State<MakeBulb> createState() => _MakeBulbState();
}

class _MakeBulbState extends State<MakeBulb> {
  final _formKey = GlobalKey<_MakeBulbState>();
  bool definedIP = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create a Lightbulb")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.lightbulb),
                    labelText: "Lightbulb Name",
                  ),
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                RadioListTile<bool>(
                  title: Text('Use Predefined IP'),
                  value: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
