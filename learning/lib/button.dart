import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool isChecked = false; // Trạng thái của checkbox
  bool isSwitched = false; // Trạng thái của switch
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Button Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('nút trong Flutter'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nút Elevated 1 nút bình thường
              ElevatedButton(
                onPressed: () {},
                child: Text("Elevated Button"),
              ),

              SizedBox(height: 20), // Khoảng cách giữa các nút

              // nút text chỉ có văn bản
              TextButton(
                onPressed: () {},
                child: Text("Text Button"),
              ),

              SizedBox(height: 20),

              //
              OutlinedButton(onPressed: () {}, child: Text('Outline Button')),

              SizedBox(height: 20),

              Text('nút Icon chỉ hiện icon'),
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),

              SizedBox(height: 20),

              //nút nỗi bât gần giống nút icon
              FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),

              SizedBox(height: 20),
              Text("thả xuống danh sách lựa chọn khi bấm"),
              DropdownButton<String>(
                  value: 'lua chon 1',
                  items: [
                    DropdownMenuItem<String>(
                        value: 'lua chon 1', child: Text('Lua chon 1')),
                    DropdownMenuItem<String>(
                        value: 'lua chon 2', child: Text('Lua chon 2')),
                  ],
                  onChanged: (newValue) {}),

              SizedBox(height: 20),

              Text("nút check box"),
              Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                },
              ),

              SizedBox(height: 20),

              Text("nút switch"),
              Switch(
                value: isSwitched,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),

              SizedBox(height: 20),

              Text("thả xuống danh sách lựa chọn khi bấm"),
              PopupMenuButton<String>(
                  onSelected: (value) {},
                  itemBuilder: (context) => [
                        PopupMenuItem<String>(
                          value: 'Lựa chọn 1',
                          child: Text('Lựa chọn 1'),
                        ),
                        PopupMenuItem<String>(
                          value: 'Lựa chọn 2',
                          child: Text('Lựa chọn 2'),
                        ),
                      ])
            ],
          ),
        ),
      ),
    );
  }
}
