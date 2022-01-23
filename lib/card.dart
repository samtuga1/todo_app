import 'package:flutter/material.dart';
import 'constants.dart' as constants;

class TodoContainer extends StatefulWidget {
  final String? cardTitle;
  final Function onPressed;
  const TodoContainer({Key? key, this.cardTitle, required this.onPressed})
      : super(key: key);

  @override
  State<TodoContainer> createState() => _TodoContainerState();
}

class _TodoContainerState extends State<TodoContainer> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
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
                    width: 50,
                    height: 50,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        widget.cardTitle.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                    ),
                    Text(
                      ('${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'),
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    )
                  ],
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            IconButton(
              onPressed: () {
                widget.onPressed;
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 32,
              ),
            )
          ],
        ),
      ),
    );
  }
}
