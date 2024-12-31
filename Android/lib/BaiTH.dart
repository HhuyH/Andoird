import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Background Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _checkbox1 = false;
  bool _checkbox2 = false;
  bool _checkbox3 = false;
  bool _checkbox4 = false;
  bool _checkbox5 = false;
  // bool _checkbox6 = false;
  bool _checkbox7 = false;
  bool _checkbox8 = false;
  // bool _checkbox9 = false;

  String _displayData = ''; // Biến để chứa dữ liệu sẽ hiển thị trong Container

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: Color.fromARGB(199, 34, 167, 229),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TextField for Name
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Enter your Name',
              ),
            ),
            const SizedBox(height: 5),
            // TextField for Phone Number
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                hintText: 'Enter your phone number',
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            Container(
              height: 190,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(100, 150, 200, 1)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Cheese Options',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _checkbox1,
                          onChanged: (bool? value) {
                            setState(() {
                              _checkbox1 = value ?? false;
                            });
                          },
                        ),
                        const Text('Cheese'),
                        Checkbox(
                          value: _checkbox2,
                          onChanged: (bool? value) {
                            setState(() {
                              _checkbox2 = value ?? false;
                            });
                          },
                        ),
                        const Text('x2 Cheese'),
                        Checkbox(
                          value: _checkbox3,
                          onChanged: (bool? value) {
                            setState(() {
                              _checkbox3 = value ?? false;
                            });
                          },
                        ),
                        const Text('None'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _checkbox4,
                          onChanged: (bool? value) {
                            setState(() {
                              _checkbox4 = value ?? false;
                            });
                          },
                        ),
                        const Text('Square'),
                        Checkbox(
                          value: _checkbox5,
                          onChanged: (bool? value) {
                            setState(() {
                              _checkbox5 = value ?? false;
                            });
                          },
                        ),
                        const Text('Round'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _checkbox7,
                          onChanged: (bool? value) {
                            setState(() {
                              _checkbox7 = value ?? false;
                            });
                          },
                        ),
                        const Text('BigSize'),
                        Checkbox(
                          value: _checkbox8,
                          onChanged: (bool? value) {
                            setState(() {
                              _checkbox8 = value ?? false;
                            });
                          },
                        ),
                        const Text('Size S'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),
            const Text('View Order'),
            Container(
              height: 150,
              width: 1000,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFFDEE9),
                    Color(0xFFB5FFFC)
                  ], // Gradient màu nền
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  // Allow scroll if content is large
                  child: Text(_displayData),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _displayData = '''
                    Name: ${_nameController.text}
                    Phone: ${_phoneController.text}
                    Cheese Option: ${_checkbox1 ? 'Cheese' : ''} ${_checkbox2 ? 'x2 Cheese' : ''} ${_checkbox3 ? 'None' : ''}
                    Shape: ${_checkbox4 ? 'Square' : ''} ${_checkbox5 ? 'Round' : ''}
                    Size: ${_checkbox7 ? 'BigSize' : ''} ${_checkbox8 ? 'Size S' : ''}
                  ''';
                });
              },
              child: const Text('Send'),
            ),
            ElevatedButton(
              onPressed: () {
                // Hàm hoặc hành động thực hiện khi nhấn nút
                print('SMS-PLACE YOUR ORDER button pressed!');
              },
              child: const Text('SMS-PLACE YOUR ORDER'),
            )
          ],
        ),
      ),
    );
  }
}
