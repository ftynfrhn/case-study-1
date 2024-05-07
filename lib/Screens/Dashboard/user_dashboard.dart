// NUR FATIN FARHANA BINTI HAMDAN (2014226)

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:collection/collection.dart';
import 'course_schedule_page.dart';
import '../../Component/background.dart';

// Stateful widget for the user dashboard
class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
   late CourseDataSource _courseDataSource;
   // List of courses displayed in the data grid
   List<Courses> _courses = <Courses>[];
   late DataGridController _dataGridController;

   @override
    void initState() {
      // Initialize state variable and data source
      super.initState();
      _courses = getCoursesData();
      _courseDataSource = CourseDataSource(_courses);
      _dataGridController = DataGridController();
    }

    @override
    Widget build(BuildContext context) {
      return Background( 
        // Background widget for the entire user dashboard
        child: Scaffold(
          // Scaffold for the user interface
          appBar: AppBar(
            title: const Text('Course Schedule'),
          ),
          // Scaffold body
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50), // Add space between AppBar and SfDataGrid
                Expanded( // Expand to occupy the remaining vertical space
                  child: Padding(
                    // Padding around the SfDataGrid
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: SfDataGrid(
                      // SfDataGrid widget to display the course schedule
                      source: _courseDataSource,
                      allowEditing: true,
                      selectionMode: SelectionMode.single,
                      navigationMode: GridNavigationMode.cell,
                      columnWidthMode: ColumnWidthMode.fill,
                      controller: _dataGridController,
                      columns: <GridColumn>[
                        GridColumn(
                          columnName: 'day', 
                          label: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'Time|Day',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        GridColumn(
                          columnName: 'mon',
                          label: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'Monday',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        GridColumn(
                          columnName: 'tue',
                          label: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'Tuesday',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        GridColumn(
                          columnName: 'wed',
                          label: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'Wednesday',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        GridColumn(
                          columnName: 'thu',
                          label: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'Thursday',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        GridColumn(
                          columnName: 'fri',
                          label: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'Friday',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                      gridLinesVisibility: GridLinesVisibility.both,
                      headerGridLinesVisibility: GridLinesVisibility.both,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Floating action button to navigate to the course schedule info page
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CourseSchedulePage()),
              );
            },
            child: const Icon(Icons.info),
          ),
        ),
      );
    }

  List<Courses> getCoursesData() {
    return [
      Courses('08:30 AM - 09:50 AM', '', '', '', '', ''),
      Courses('10:00 AM - 11:20 AM', '', '', '', '', 'CSCI 4401'),
      Courses('11:30 AM - 12:50 PM', '', '', '', '', ''),
      Courses('02:00 PM - 03:20 PM', '', '', '', '', ''),
      Courses('03:30 PM - 04:50 PM', '', '', '', '', '')
    ];
  }
}

class Courses {
  Courses(this.time, this.mon, this.tue, this.wed, this.thu, this.fri);

  final String time;
  String mon;
  String tue;
  String wed;
  String thu;
  String fri;

  DataGridRow getDataGridRow() {
    return DataGridRow(cells: <DataGridCell>[
      DataGridCell<String>(columnName: 'time', value: time),
      DataGridCell<String>(columnName: 'mon', value: mon),
      DataGridCell<String>(columnName: 'tue', value: tue),
      DataGridCell<String>(columnName: 'wed', value: wed),
      DataGridCell<String>(columnName: 'thu', value: thu),
      DataGridCell<String>(columnName: 'fri', value: fri),
    ]);
  }
}

class CourseDataSource extends DataGridSource {
  CourseDataSource(this._courses) {
    dataGridRows = _courses
    .map<DataGridRow>((dataGridRow) => dataGridRow.getDataGridRow())
    .toList();
  }

  List<Courses> _courses = [];
  List<DataGridRow> dataGridRows = [];

  String? newCellValue;

  TextEditingController editingController = TextEditingController();

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
        ));
      }).toList());
  }

// Handle cell submissions and update data source accordingly
@override
Future<void> onCellSubmit(
    DataGridRow dataGridRow, RowColumnIndex rowColumnIndex, GridColumn column) async {
  final dynamic oldValue = dataGridRow
          .getCells()
          .firstWhere((DataGridCell dataGridCell) =>
              dataGridCell.columnName == column.columnName)
          .value ??
      '';

  final int dataRowIndex = dataGridRows.indexOf(dataGridRow);

  if (newCellValue == null || oldValue == newCellValue) {
    return;
  }

  if (column.columnName == 'mon') {
    dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
        DataGridCell<String>(columnName: 'mon', value: newCellValue!);
    _courses[dataRowIndex].mon = newCellValue.toString();
  } else if (column.columnName == 'tue') {
    dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
        DataGridCell<String>(columnName: 'tue', value: newCellValue!);
    _courses[dataRowIndex].tue = newCellValue.toString();
  } else if (column.columnName == 'wed') {
    dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
        DataGridCell<String>(columnName: 'wed', value: newCellValue!);
    _courses[dataRowIndex].wed = newCellValue.toString();
  } else if (column.columnName == 'thu') {
    dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
        DataGridCell<String>(columnName: 'thu', value: newCellValue!);
    _courses[dataRowIndex].thu = newCellValue.toString();
  } else {
    dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
        DataGridCell<String>(columnName: 'fri', value: newCellValue!);
    _courses[dataRowIndex].fri = newCellValue.toString();
  }
}


  @override
  Future<bool> canSubmitCell(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex, GridColumn column) {
    return Future.value(true);
  }

  @override
  Widget? buildEditWidget(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex, GridColumn column, CellSubmit submitCell) {
    
    final String displayText = dataGridRow
            .getCells()
            .firstWhereOrNull((DataGridCell dataGridCell) => 
                dataGridCell.columnName == column.columnName)
        ?.value 
        ?.toString() ??
        '';

    newCellValue = null;

    final RegExp regExp = _getRegExp(column.columnName);

    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: TextField(
        autofocus: true,
        controller: editingController..text = displayText,
        textAlign: TextAlign.center,
        autocorrect: false,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 16.0),
        ),
        inputFormatters: <TextInputFormatter>[
          LengthLimitingTextInputFormatter(9),
          FilteringTextInputFormatter.allow(regExp)
        ],
        keyboardType: TextInputType.text,
        onChanged: (String value) {
          if (value.isNotEmpty) {
            newCellValue = value;
          } else {
            newCellValue = null;
          }
        },
        onSubmitted: (String value) {
          submitCell();
        },
      ),
    );
  }

  RegExp _getRegExp(String columnName) {
    return RegExp(r'[A-Z0-9\s]');
  }
}