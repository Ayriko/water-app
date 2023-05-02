import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Test extends StatefulWidget {
  @override
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<Test> {
  TextEditingController _textController1 = TextEditingController();
  TextEditingController _textController2 = TextEditingController();
  TextEditingController _textController3 = TextEditingController();
  final _myBox = Hive.box('waterApp');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textController1.dispose();
    _textController2.dispose();
    super.dispose();
  }

  void _saveValueName(String value) {
    _myBox.put('username', value);
    _textController1.clear();
    setState(() {});
  }

  void _saveValueMail(String value) {
    _myBox.put('email', value);
    _textController2.clear();
    setState(() {});
  }

  void _saveValueLocal(String value) {
    _myBox.put('location', value);
    _textController3.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String name = _myBox.get('username', defaultValue: 'username');
    String email = _myBox.get('email', defaultValue: 'mail@mail');
    String local = _myBox.get('location', defaultValue: 'bordeaux');
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
            controller: _textController1,
            decoration: InputDecoration(
              hintText: 'Enter your name',
              suffixIcon: IconButton(
                icon: Icon(Icons.save),
                onPressed: () => _saveValueName(_textController1.text),
              ),
            ),
          ),
          TextField(
            controller: _textController2,
            decoration: InputDecoration(
              hintText: 'Enter your email',
              suffixIcon: IconButton(
                icon: Icon(Icons.save),
                onPressed: () => _saveValueMail(_textController2.text),
              ),
            ),
          ),
          TextField(
            controller: _textController3,
            decoration: InputDecoration(
              hintText: 'Enter your location',
              suffixIcon: IconButton(
                icon: Icon(Icons.save),
                onPressed: () => _saveValueLocal(_textController3.text),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text('Values in username:'),
          SizedBox(height: 8),
          Expanded(
            child: Text(name),
          ),
          SizedBox(height: 16),
          Text('Values in mail:'),
          SizedBox(height: 8),
          Expanded(
            child: Text(email),
          ),
          SizedBox(height: 16),
          Text('Values in location:'),
          SizedBox(height: 8),
          Expanded(
            child: Text(local),
          ),
        ],
      ),
    );
  }
}
