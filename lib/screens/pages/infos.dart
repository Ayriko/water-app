import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class Infos extends StatefulWidget {
  Infos({super.key});

  @override
  State<Infos> createState() => _InfosState();
}

class _InfosState extends State<Infos> {
  TextEditingController _textController1 = TextEditingController();
  TextEditingController _textController2 = TextEditingController();
  TextEditingController _textController3 = TextEditingController();
  final _myBox = Hive.box('waterApp');

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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String name = _myBox.get('username', defaultValue: 'username');
    String email = _myBox.get('email', defaultValue: 'mail@mail');
    String local = _myBox.get('location', defaultValue: 'bordeaux');
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 196, 242, 255),
      appBar: AppBar(
          title: const Text('Paramètres'),
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
      body: Container(
          padding: EdgeInsets.only(left: 15, top: 20, right: 15),
          child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  Container(
                      height: 50,
                      child: Center(
                        child: Text(
                          "Données Personnelles",
                          style: GoogleFonts.paytoneOne(
                            color: const Color.fromARGB(255, 18, 138, 176),
                            fontSize: 20,
                            // fontWeight: FontWeight.w700,
                          ),
                        ),
                      )),

                  const SizedBox(height: 15),
                  TextField(
                    controller: _textController1,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 5),
                      labelText: "Nom/Username",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: name,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Color.fromARGB(255, 18, 138, 176),
                      ),
                      icon: IconButton(
                        icon: Icon(Icons.check,
                            color: const Color.fromARGB(255, 18, 138, 176)),
                        onPressed: () => _saveValueName(_textController1.text),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),
                  TextField(
                    controller: _textController2,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 5),
                      labelText: "Adresse Mail",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: email,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Color.fromARGB(255, 18, 138, 176),
                      ),
                      icon: IconButton(
                        icon: Icon(Icons.check,
                            color: const Color.fromARGB(255, 18, 138, 176)),
                        onPressed: () => _saveValueMail(_textController2.text),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),
                  TextField(
                    controller: _textController3,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 5),
                      labelText: "Localisation",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: local,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Color.fromARGB(255, 18, 138, 176),
                      ),
                      icon: IconButton(
                        icon: Icon(Icons.check,
                            color: const Color.fromARGB(255, 18, 138, 176)),
                        onPressed: () => _saveValueLocal(_textController3.text),
                      ),
                    ),
                  ),
                  //buildTextField("Nom", name, false),
                  //buildTextField("Email", "username@gmail.com", false),
                  //buildTextField("Localisation", "Bordeaux", false),
                  
                  Row(
                    children: [
                      Text(
                        "Supprimer les données de l'appareil",
                        style: GoogleFonts.paytoneOne(
                          color: const Color.fromARGB(255, 18, 138, 176),
                          fontSize: 15,
                          // fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {},
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Container(
                      height: 50,
                      child: Center(
                        child: Text(
                          "Notifications",
                          style: GoogleFonts.paytoneOne(
                            color: const Color.fromARGB(255, 18, 138, 176),
                            fontSize: 20,
                            // fontWeight: FontWeight.w700,
                          ),
                        ),
                      )),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        "Activer les notifications ?",
                        style: GoogleFonts.paytoneOne(
                          color: const Color.fromARGB(255, 18, 138, 176),
                          fontSize: 15,
                          // fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.notifications_active),
                        onPressed: () {},
                      )
                    ],
                  ),
                ],
              ))),
    );
  }
}
