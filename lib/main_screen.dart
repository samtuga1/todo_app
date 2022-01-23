import 'package:flutter/material.dart';
import 'constants.dart' as constants;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> cardName = [];
  final taskName = TextEditingController();
  int counter = 0;
  late String cardTitle;

  showModalSheet() {
    showModalBottomSheet(
        backgroundColor: constants.Colors.scaffold,
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 60.0),
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextField(
                  controller: taskName,
                  decoration: const InputDecoration(hintText: 'Task Name'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      cardName.add(taskName.text.toString());
                      counter++;
                      taskName.clear();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 35,
        ),
        onPressed: () => showModalSheet(),
        backgroundColor: const Color(0xFF6980de),
        tooltip: 'Add New Task',
        elevation: 20,
      ),
      backgroundColor: constants.Colors.scaffold,
      body: Column(
        children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                color: constants.Colors.container,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0, bottom: 20),
                      child: FaIcon(
                        FontAwesomeIcons.suitcase,
                        color: constants.Colors.suitCase,
                        size: 50,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0, bottom: 30),
                      child: Text(
                        'Complete these tasks',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 210,
                bottom: -65,
                child: Image.asset(
                  'assets/images/girl.png',
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15, top: 20),
                child: const Text(
                  'ToDo Lists',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: counter,
                itemBuilder: (BuildContext context, index) {
                  return TodoContainer(
                    onPressed: () {},
                    cardTitle: cardName[index],
                  );
                }),
          )
        ],
      ),
    );
  }
}
