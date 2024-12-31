import 'package:flutter/material.dart';

class AddExercise extends StatefulWidget {
  const AddExercise({super.key});

  @override
  _AddExerciseState createState() => _AddExerciseState();
  // tạo một đối tượng State cho màn hình AddExerciseScreen
  // giúp quản lý và cập nhật dữ liệu cho màn hình khi người dùng tương tác
}

class _AddExerciseState extends State<AddExercise> {
  final TextEditingController _dateController =
      TextEditingController(); //biến chứa dữ liệu ngày
  final TextEditingController nameController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController caloriesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Exercise')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Exercise Name'),
            ),
            TextField(
              controller: durationController,
              decoration: const InputDecoration(labelText: 'Duration (min)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: caloriesController,
              decoration: const InputDecoration(labelText: 'Calories'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(
                labelText: 'Date',
                filled: true,
                prefixIcon: Icon(Icons.calendar_month_sharp),
              ),
              readOnly: true,
              onTap: () {
                _selectData();
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(
                  width: 40,
                ),
                //
                //nut chập nhận
                ElevatedButton(
                  onPressed: () {
                    // Return the entered data
                    Navigator.pop(context, {
                      'name': nameController.text,
                      'duration': durationController.text,
                      'calories': caloriesController.text,
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 50),
                    backgroundColor: const Color.fromARGB(188, 16, 163, 80),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //
                const SizedBox(
                  width: 20,
                ),
                //nút logout
                ElevatedButton(
                  onPressed: () {
                    // Log out and return
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 50),
                    backgroundColor: const Color.fromARGB(189, 227, 44, 44),
                  ),
                  child: const Text(
                    "Log out",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectData() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _dateController.text = picked
            .toString()
            .split(" ")[0]; // Set the picked date to the controller
      });
    }
  }
}
