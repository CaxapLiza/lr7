import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MatrixApp extends StatefulWidget {
  @override
  _MatrixAppState createState() => _MatrixAppState();
}

class _MatrixAppState extends State<MatrixApp> {
  int rows = 3;
  int columns = 3;
  List<List<int>> matrix = List.generate(3, (_) => List.generate(3, (_) => 0));
  int a = 0;
  int b = 0;
  bool isInRange = false;

  void fillMatrixRandomly() {
    final random = Random();
    for (int i = 0; i < matrix.length; i++) {
      for (int j = 0; j < matrix[i].length; j++) {
        matrix[i][j] = random.nextInt(100);
      }
    }
  }

  bool isRowInRange(List<int> row, int a, int b) {
    for (int value in row) {
      if (value < a || value > b) {
        return false;
      }
    }
    return true;
  }

  void checkRange(int a, int b) {
    bool found = false;
    for (List<int> row in matrix) {
      if (isRowInRange(row, a, b)) {
        found = true;
        break;
      }
    }
    setState(() {
      isInRange = found;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Матрицы'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Column(
                children: [
                  LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        final orientation = MediaQuery.of(context).orientation;

                        if (orientation == Orientation.portrait) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Text("Строки: "),
                                  SizedBox(width: 8),
                                  Text(rows.toString()),
                                  SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        rows++;
                                        matrix = List.generate(rows, (_) => List.generate(columns, (_) => 0));
                                      });
                                    },
                                    child: Icon(Icons.plus_one),
                                  ),
                                  SizedBox(width: 8),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (rows > 2) {
                                          rows--;
                                          matrix = List.generate(rows, (_) => List.generate(columns, (_) => 0));
                                        }
                                      });
                                    },
                                    child: Icon(Icons.exposure_minus_1),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Колонки: "),
                                  SizedBox(width: 8),
                                  Text(columns.toString()),
                                  SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        columns++;
                                        matrix = List.generate(rows, (_) => List.generate(columns, (_) => 0));
                                      });
                                    },
                                    child: Icon(Icons.plus_one),
                                  ),
                                  SizedBox(width: 8),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (columns > 2) {
                                          columns--;
                                          matrix = List.generate(rows, (_) => List.generate(columns, (_) => 0));
                                        }
                                      });
                                    },
                                    child: Icon(Icons.exposure_minus_1),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        fillMatrixRandomly();
                                      });
                                    },
                                    child: Text("Заполнить случайно"),
                                  ),
                                ],
                              ),
                            ],
                          );
                        } else {
                          return Row(
                            children: [
                              Row(
                                children: [
                                  Text("Строки: "),
                                  SizedBox(width: 8),
                                  Text(rows.toString()),
                                  SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        rows++;
                                        matrix = List.generate(rows, (_) => List.generate(columns, (_) => 0));
                                      });
                                    },
                                    child: Icon(Icons.plus_one),
                                  ),
                                  SizedBox(width: 8),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (rows > 2) {
                                          rows--;
                                          matrix = List.generate(rows, (_) => List.generate(columns, (_) => 0));
                                        }
                                      });
                                    },
                                    child: Icon(Icons.exposure_minus_1),
                                  ),
                                ],
                              ),
                              SizedBox(width: 15),
                              Row(
                                children: [
                                  Text("Колонки: "),
                                  SizedBox(width: 8),
                                  Text(columns.toString()),
                                  SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        columns++;
                                        matrix = List.generate(rows, (_) => List.generate(columns, (_) => 0));
                                      });
                                    },
                                    child: Icon(Icons.plus_one),
                                  ),
                                  SizedBox(width: 8),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (columns > 2) {
                                          columns--;
                                          matrix = List.generate(rows, (_) => List.generate(columns, (_) => 0));
                                        }
                                      });
                                    },
                                    child: Icon(Icons.exposure_minus_1),
                                  ),
                                ],
                              ),
                              SizedBox(width: 15),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        fillMatrixRandomly();
                                      });
                                    },
                                    child: Text("Заполнить случайно"),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                      }
                  ),
                ],
              ),
              Divider(height: 16),
              Table(
                border: TableBorder.all(),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: List.generate(rows, (rowIndex) {
                  return TableRow(
                    children: List.generate(columns, (columnIndex) {
                      return GestureDetector(
                        onTap: () => showEditDialog(rowIndex, columnIndex),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          color: Colors.grey[200],
                          child: Text(matrix[rowIndex][columnIndex].toString()),
                        ),
                      );
                    }),
                  );
                }),
              ),
              Row(
                children: [
                  Text("A: "),
                  SizedBox(width: 8),
                  Container(
                    width: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        a = int.tryParse(value) ?? 0;
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Text("B: "),
                  SizedBox(width: 8),
                  Container(
                    width: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        b = int.tryParse(value) ?? 0;
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      checkRange(a, b);
                    },
                    child: Text("Проверить диапазон"),
                  ),
                ],
              ),
              if (isInRange)
                Text(
                  "Есть строка, в которой все числа находятся в диапазоне [$a, $b]",
                  style: TextStyle(color: Colors.green),
                ),
              if (!isInRange)
                Text(
                  "Нет строки, в которой все числа находятся в диапазоне [$a, $b]",
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void showEditDialog(int rowIndex, int columnIndex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Изменить элемент'),
          content: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                matrix[rowIndex][columnIndex] = int.tryParse(value) ?? 0;
              });
            },
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matrix App',
      home: MatrixApp(),
    );
  }
}