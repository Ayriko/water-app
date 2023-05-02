import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:water_app/notification_service.dart';

class Infos extends StatefulWidget {
  Infos({super.key});

  @override
  State<Infos> createState() => _InfosState();
}

class _InfosState extends State<Infos> {
  bool isObscurePassword = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  buildTextField("Nom", "Username", false),
                  buildTextField("Email", "username@gmail.com", false),
                  buildTextField("Localisation", "Bordeaux", false),
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
                        onPressed: () {
                          NotificationService().showNotification(
                            title: 'Nique ta mère !', body: 'OUAIS OUAIS OUAIS T AS COMPRIS BATARD !',
                          );
                        }
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Désactiver les notifications ?",
                        style: GoogleFonts.paytoneOne(
                          color: const Color.fromARGB(255, 18, 138, 176),
                          fontSize: 15,
                          // fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.notifications_off),
                        onPressed: () {},
                      )
                    ],
                  ),
                  const SizedBox(height: 150),
                  Text(
                    "Support",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.paytoneOne(
                      color: const Color.fromARGB(255, 18, 138, 176),
                      fontSize: 15,
                      // fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ))),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: TextField(
            obscureText: isPasswordTextField ? isObscurePassword : false,
            decoration: InputDecoration(
                suffixIcon: isPasswordTextField
                    ? IconButton(
                        icon: Icon(Icons.remove_red_eye, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            isObscurePassword = !isObscurePassword;
                          });
                        })
                    : null,
                contentPadding: EdgeInsets.only(bottom: 5),
                labelText: labelText,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: placeholder,
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 18, 138, 176),
                ),
                icon: IconButton(
                  icon: Icon(Icons.check,
                      color: const Color.fromARGB(255, 18, 138, 176)),
                  onPressed: () {},
                ))));
  }
}

