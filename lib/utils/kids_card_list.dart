import 'package:flutter/material.dart';

class KidsCardList extends StatelessWidget {
  const KidsCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(3, (index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text('Kid ${index + 1}'),
            subtitle: Text('Details about Kid ${index + 1}'),
          ),
        );
      }),
    );
  }
}
