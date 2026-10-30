import 'package:flutter/material.dart';

class MakeBulb extends StatefulWidget {
  const MakeBulb({super.key});

  @override
  State<MakeBulb> createState() => _MakeBulbState();
}

class _MakeBulbState extends State<MakeBulb> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                RadioGroup<bool>(
                  onChanged: (bool? value) {
                    setState(() {
                      definedIP = value ?? false;
                    });
                  },
                  groupValue: definedIP,
                  child: Column(
                    children: [
                      RadioListTile<bool>(
                        title: Text('Use Predefined IP'),
                        subtitle: Text(
                          "If you already know the lightbulb's IP",
                        ),
                        value: true,
                      ),
                      RadioListTile<bool>(
                        title: Text('Use Limited Brodcast Address'),
                        subtitle: Text("If you don't know the lightbulb's IP"),
                        value: false,
                      ),
                    ],
                  ),
                ),
                if (definedIP == true)
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.dns),
                      labelText: "Lightbulb IP",
                      hintText: "255.255.255.255",
                    ),
                    maxLength: 15,
                  ),

                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.settings_ethernet),
                    labelText: "Port",
                  ),
                  maxLength: 5,
                  validator: (value) => value!.isEmpty ? "Required" : null,
                ),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Submitted")),
                      );
                    }
                  },
                  child: const Text("Create Lightbulb"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
