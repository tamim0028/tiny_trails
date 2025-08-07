import 'package:flutter/material.dart';
import 'package:myapp/utils/Kid.dart';

class AddEditKidModal extends StatefulWidget {
  final Kid? existingKid;
  final Function(Kid) onSave;

  const AddEditKidModal({super.key, this.existingKid, required this.onSave});

  @override
  State<AddEditKidModal> createState() => _AddEditKidModalState();
}

class _AddEditKidModalState extends State<AddEditKidModal> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late int _age;
  late String _gender;

  @override
  void initState() {
    super.initState();
    _name = widget.existingKid?.name ?? '';
    _age = widget.existingKid?.age ?? 0;
    _gender = widget.existingKid?.gender ?? 'Male';
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final kid = Kid(name: _name, age: _age, gender: _gender);
      widget.onSave(kid);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.existingKid != null;

    return AlertDialog(
      title: Text(isEditing ? 'Edit Kid' : 'Add Kid'),
      content: Form(
        key: _formKey,
        child: SizedBox(
          width: 300,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: _name,
                  decoration: const InputDecoration(labelText: 'Name'),
                  onSaved: (value) => _name = value ?? '',
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Enter name' : null,
                ),
                TextFormField(
                  initialValue: _age == 0 ? '' : _age.toString(),
                  decoration: const InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) =>
                      _age = int.tryParse(value ?? '') ?? 0,
                  validator: (value) {
                    final age = int.tryParse(value ?? '');
                    if (age == null || age <= 0) return 'Enter valid age';
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _gender,
                  items: const [
                    DropdownMenuItem(value: 'Male', child: Text('Male')),
                    DropdownMenuItem(value: 'Female', child: Text('Female')),
                  ],
                  onChanged: (value) => setState(() {
                    _gender = value ?? 'Male';
                  }),
                  decoration: const InputDecoration(labelText: 'Gender'),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: Text(isEditing ? 'Update' : 'Add'),
        ),
      ],
    );
  }
}
