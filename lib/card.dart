import 'package:flutter/material.dart';
import 'constants.dart' as constants;

class TodoContainer extends StatefulWidget {
  final String? cardTitle;
  const TodoContainer({Key? key, this.cardTitle}) : super(key: key);

  @override
  State<TodoContainer> createState() => _TodoContainerState();
}

class _TodoContainerState extends State<TodoContainer> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    check = !check;
                  }),
                  child: Container(
                    child: check == false
                        ? null
                        : Icon(
                            Icons.check,
                            size: 35,
                            color: constants.Colors.suitCase,
                          ),
                    margin: const EdgeInsets.only(right: 15, left: 15),
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: constants.Colors.container, width: 2.5),
                      borderRadius: BorderRadius.circular(10),
                      color: check == false
                          ? Colors.white
                          : constants.Colors.container,
                    ),
                  ),
                ),
                Text(
                  widget.cardTitle.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              margin: const EdgeInsets.only(right: 23),
              child: Text(
                ('${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'),
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
