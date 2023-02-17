import 'package:firebase_crud/widgets/crud_steps.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class CRUDManual extends StatelessWidget {
  const CRUDManual({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
              title: const Text("Flutter Firebase Manual"),
              bottom: const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.create),
                    text: "Create",
                  ),
                  Tab(
                    icon: Icon(Icons.cloud_download),
                    text: "Read",
                  ),
                  Tab(
                    icon: Icon(Icons.update),
                    text: "Update",
                  ),
                  Tab(
                    icon: Icon(Icons.delete),
                    text: "Delete",
                  ),
                ],
              )),
          body: TabBarView(
            children: [
              CRUDSteps(title: "Create Data", stepsList: Data.createData),
              CRUDSteps(title: "Read Data", stepsList: Data.readData),
              CRUDSteps(title: "Update Data", stepsList: Data.updateData),
              CRUDSteps(title: "Delete Data", stepsList: Data.deleteData),
            ],
          )),
    );
  }
}
