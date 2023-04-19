import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:water_app/screens/pages/calendrier.dart';
import 'package:water_app/screens/pages/page_accueil.dart';



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
      appBar: AppBar(
        title: const Text('Page de Profil'),
        backgroundColor :Color.fromARGB(255, 95, 208, 243),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.asset('assets/images/Quality.png'),
            onPressed:() {},
            )
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back, 
            color: Colors.white
          ),
          onPressed: () {},

        )
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child : ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Colors.white),
                  boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1)
                    )
                  ], 
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://st.depositphotos.com/2101611/3925/v/450/depositphotos_39258143-stock-illustration-businessman-avatar-profile-picture.jpg'
                    ),
                  )
                ),
              ),
                    Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 4,
                      color: Colors.white
                    ),
                    color: Colors.blue,
                  ),
                  child: const Icon(
                    Icons.edit,
                    color:Colors.white,
                  )
                )
              ),
                  ],
                )
              ),
              SizedBox(height: 30),
              buildTextField("Nom", "Demon", false),
              buildTextField("Email", "demon@gmail.com", false), 
              buildTextField("Mot de Passe", "*********", true),
              buildTextField("Localisation", "Bordeaux", false),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    child: const Text("CANCEL", style: TextStyle(
                      fontSize: 15, 
                      letterSpacing: 2,
                      color:Colors.black
                    )),                    
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    child: const Text("SAVE", style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 2,
                      color:Colors.white,
                    ))
                  )
                ],
              )
            ],

          )
        )
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: EdgeInsets.only(bottom:30),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField ?
            IconButton(
              icon: Icon(Icons.remove_red_eye, color: Colors.grey),
              onPressed: () {
                setState((){
                isObscurePassword =! isObscurePassword;
                });
              }              
            ):null,
          contentPadding: EdgeInsets.only(bottom:5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          )
        ),
      ),
    );
  }
}

