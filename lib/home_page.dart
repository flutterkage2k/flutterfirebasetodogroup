import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> dropDownMenu = ['매출', '매입', '입금'];
  String? selectedDropdownMenu = '매출';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("대명파렛트관리대장"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showAddDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(decoration: const InputDecoration(helperText: '상호')),
                TextField(decoration: const InputDecoration(helperText: '거래일')),
                DropdownButton(
                    value: selectedDropdownMenu,
                    items: dropDownMenu
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            ))
                        .toList(),
                    onChanged: (item) => setState(() {
                          selectedDropdownMenu = item!;
                        })),
                // TextField(decoration: const InputDecoration(helperText: '구분')),
                TextField(decoration: const InputDecoration(helperText: '금액')),
                TextField(decoration: const InputDecoration(helperText: '메모')),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: () {}, child: const Text("저장하기"))
              ],
            ),
          ),
        );
      },
    );
  }
}
