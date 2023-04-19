import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Test extends StatefulWidget {
  @override
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<Test> {
  TextEditingController _textController = TextEditingController();
  late Box _hiveBox;

  @override
  void initState() {
    super.initState();

    _hiveBox = Hive.box('myBox');
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _saveValue(String value) {
    _hiveBox.add(value);
    _textController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 196, 242, 255),
      appBar: AppBar(
          title: const Text('test raph'),
          backgroundColor: Color.fromARGB(255, 95, 208, 243),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Image.asset('assets/images/Quality.png'),
              onPressed: () {},
            )
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {},
          )),
      body: Column(
        children: [
          TextField(
            controller: _textController,
            decoration: InputDecoration(
              hintText: 'Enter a value',
              suffixIcon: IconButton(
                icon: Icon(Icons.save),
                onPressed: () => _saveValue(_textController.text),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text('Values in Hive box:'),
          SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: _hiveBox.length,
              itemBuilder: (BuildContext context, int index) {
                final value = _hiveBox.getAt(index);
                return ListTile(
                  title: Text(value),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
