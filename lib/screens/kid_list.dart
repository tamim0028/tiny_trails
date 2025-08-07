import 'package:flutter/material.dart';
import 'package:myapp/utils/Kid.dart';
import 'package:myapp/utils/add_edit_kid_modal.dart';
import 'package:myapp/utils/app_colors.dart';
import 'package:myapp/widgets/bottom_nav_bar.dart';
import 'package:myapp/widgets/custom_drawer.dart';

class KidListScreen extends StatefulWidget {
  const KidListScreen({super.key});

  @override
  State<KidListScreen> createState() => _KidListScreenState();
}

class _KidListScreenState extends State<KidListScreen> {
  final List<Kid> _kids = [];

  void _showKidModal({Kid? kid, int? index}) {
    showDialog(
      context: context,
      builder: (_) => AddEditKidModal(
        existingKid: kid,
        onSave: (newKid) {
          setState(() {
            if (kid == null) {
              _kids.add(newKid);
            } else if (index != null) {
              _kids[index] = newKid;
            }
          });
        },
      ),
    );
  }

  void _deleteKid(int index) {
    setState(() {
      _kids.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kids List',
          style: TextStyle(color: AppColors.textColor),
        ),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Dynamic editable kids
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _kids.length,
              itemBuilder: (context, index) {
                final kid = _kids[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(child: Text('${index + 4}')),
                    title: Text(kid.name),
                    subtitle: Text('Age: ${kid.age}, Gender: ${kid.gender}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _showKidModal(kid: kid, index: index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _deleteKid(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showKidModal(),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: null),
    );
  }
}
