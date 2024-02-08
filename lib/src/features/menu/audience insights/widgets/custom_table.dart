import 'package:ads/src/features/menu/audience%20insights/audience_insights.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_checkbox.dart';

class MyTableWidget extends StatefulWidget {
  const MyTableWidget({
    super.key,
  });

  @override
  State<MyTableWidget> createState() => _MyTableWidgetState();
}

class _MyTableWidgetState extends State<MyTableWidget> {
  List<MyTableRowData> tableData = [
    MyTableRowData(name: 'saichittala portfolio', status: 'Ready'),
    MyTableRowData(name: 'ricoz - website', status: 'Ready'),
    MyTableRowData(name: 'makeuphub Website', status: 'Ready'),
    MyTableRowData(name: 'ricoz Website', status: 'Ready'),
    MyTableRowData(name: 'ricoz Website', status: 'Ready'),
    MyTableRowData(name: 'ricoz Website', status: 'Ready'),
    MyTableRowData(name: 'ricoz Website', status: 'Ready'),
    MyTableRowData(name: 'ricoz Website', status: 'Expiring Soon'),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(5),
          2: FlexColumnWidth(3)
        },
        border: TableBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          bottom: BorderSide(color: kblack.withOpacity(0.1)),
          top: BorderSide(color: kblack.withOpacity(0.1)),
          left: BorderSide(color: kblack.withOpacity(0.1)),
          right: BorderSide(color: kblack.withOpacity(0.1)),
          verticalInside: BorderSide(color: kblack.withOpacity(0.1)),
        ),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: kblack.withOpacity(0.1),
                ),
              ),
            ),
            children: [
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomCheckbox(
                      onchanged: (value) {},
                      mainAxisAlignment: MainAxisAlignment.center,
                      value: false),
                ),
              ),
              const TableCell(
                child: Center(
                  child: Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                ),
              ),
              const TableCell(
                child: Center(
                  child: Text(
                    'Status',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          for (var rowData in tableData)
            TableRow(
              children: [
                TableCell(
                  child: CustomCheckbox(
                    value: rowData.isSelected,
                    onchanged: (value) {
                      setState(() {
                        rowData.isSelected = value ?? false;
                      });
                    },
                  ),
                ),
                TableCell(
                  child: Center(
                    heightFactor: 2.5,
                    child: Text(
                      rowData.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 12),
                    ),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Text(
                      rowData.status,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xff00C944),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class MyTableRowData {
  final String name;
  final String status;
  bool isSelected;

  MyTableRowData({
    required this.name,
    required this.status,
    this.isSelected = false,
  });
}
