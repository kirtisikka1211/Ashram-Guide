import 'package:flutter/material.dart';

class calender extends StatefulWidget {
  const calender({super.key});

  @override
  State<calender> createState() => calenderState();
}

class calenderState extends State<calender> {
  DateTimeRange selectedDates = DateTimeRange(
    start: DateTime.now(),
     end: DateTime.now()
  );
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "${selectedDates.duration.inDays}",
          ),
          ElevatedButton(
             child: const Text("choose dates"),
             onPressed: () async {
              final DateTimeRange? dateTimeRange = await showDateRangePicker(
                context: context, 
                firstDate: DateTime(2000), 
                lastDate: DateTime(3000),);
              if (dateTimeRange != null) {
                setState(() {
                  selectedDates = dateTimeRange;
                });
              }
             })
        ],
      ),
    );
  }
}