import 'package:flutter/material.dart';
import 'package:bulleted_list/bulleted_list.dart';

class CRUDSteps extends StatelessWidget {
  final String title;
  final List stepsList;
  const CRUDSteps({super.key, required this.title, required this.stepsList});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(title,
              style:
                  const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          BulletedList(
            listItems: stepsList,
            listOrder: ListOrder.ordered,
            bulletType: BulletType.numbered,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
