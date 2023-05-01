import 'package:flutter/material.dart';

class calender extends StatefulWidget {
  const calender({Key? key}) : super(key: key);

  @override
  State<calender> createState() => calenderState();
}

class calenderState extends State<calender> {
  late DateTime startDate;
  late DateTime endDate;

  @override
  void initState() {
    super.initState();
    startDate = DateTime.now();
    endDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Start Date: ${startDate.toString()}",
          ),
          Text(
            "End Date: ${endDate.toString()}",
          ),
          ElevatedButton(
            child: const Text("Choose Dates"),
            onPressed: () async {
              final DateTimeRange? dateTimeRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(2024),
              );
              if (dateTimeRange != null) {
                setState(() {
                  startDate = dateTimeRange.start;
                  endDate = dateTimeRange.end;
                });
              }
            },
          )
        ],
      ),
    );
  }
}
