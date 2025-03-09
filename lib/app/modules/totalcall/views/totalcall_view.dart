import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/totalcall_controller.dart';

class TotalcallView extends GetView<TotalcallController> {TotalcallView({super.key});
  final List<Map<String, String>> callRecords = List.generate(
    15,
        (index) => {
      'ID': (index + 1).toString(),
      'Call From': '8287911276',
      'Number': '9898',
      'Start Time': '2025-03-03 13:02:04',
      'End Time': '2025-03-03 13:02:52',
      'Duration': '00:00:00',
      'Status': 'NOANSWER',
      'Hangup': 'CLIENT',
      'Direction': 'outbound',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(()=> Text('${controller.title} Records', style: TextStyle(fontSize: 20))),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Text(
                DateFormat('hh:mm:ss a GMT+5:30').format(DateTime.now()),
                style: TextStyle(fontSize: Get.height/70, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            width: Get.width/5,
            height: Get.height/25,
            child: ElevatedButton(

              onPressed: () {},
              child: Text("Live Calls",style: TextStyle(
                fontSize: Get.height/70
              ),),
            ),
          ),
          SizedBox(width: 8),
          Container(
            width: Get.width/5,
            height: Get.height/25,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Phone"),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: DataTable(

            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Call From')),
              DataColumn(label: Text('Number')),
              DataColumn(label: Text('Start Time')),
              DataColumn(label: Text('End Time')),
              DataColumn(label: Text('Duration')),
              DataColumn(label: Text('Status')),
              DataColumn(label: Text('Hangup')),
              DataColumn(label: Text('Direction')),
              DataColumn(label: Text('Recording')),
            ],
            rows: callRecords.map((record) {
              return DataRow(cells: [
                DataCell(Text(record['ID']!)),
                DataCell(Text(record['Call From']!)),
                DataCell(Text(record['Number']!)),
                DataCell(Text(record['Start Time']!)),
                DataCell(Text(record['End Time']!)),
                DataCell(Text(record['Duration']!)),
                DataCell(Text(record['Status']!)),
                DataCell(Text(record['Hangup']!)),
                DataCell(Text(record['Direction']!)),
                DataCell(Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.play_arrow),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.download),
                      onPressed: () {},
                    ),
                  ],
                )),
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
