import 'package:flutter/material.dart';

class BirthdayForm extends StatefulWidget {
  const BirthdayForm({Key? key}) : super(key: key);

  @override
  _BirthdayFormState createState() => _BirthdayFormState();
}

class _BirthdayFormState extends State<BirthdayForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Birthday'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Birthdate',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a birthdate';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: Save birthday to database
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
