import 'package:flutter/material.dart';
import '../person_model.dart';
import '../api_service.dart';
import '../widgets/list_item_widget.dart';

class PersonsScreen extends StatefulWidget {
  const PersonsScreen({super.key});

  @override
  State<PersonsScreen> createState() => _PersonsScreenState();
}

class _PersonsScreenState extends State<PersonsScreen>
    with AutomaticKeepAliveClientMixin<PersonsScreen> {
  late Stream<List<Person>> streamPersons;

  @override
  void initState() {
    super.initState();
    streamPersons = fetchPersons();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("All Records",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0)),
        ),
        Expanded(
          child: Center(
            child: StreamBuilder<List<Person>>(
              stream: streamPersons,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final persons = snapshot.data!;
                  return buildList(persons);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget buildList(List<Person> persons) {
    return ListView.builder(
      itemCount: persons.length,
      itemBuilder: (context, index) {
        final person = persons[index];
        return ListItem(person: person);
      },
    );
  }
}
