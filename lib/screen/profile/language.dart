import 'package:flutter/material.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  String currentLanguage = "Bahasa Indonesia";

  void _changeLanguage(String newLanguage) async {
    // Show loading popup
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissal by tapping outside
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Simulate a delay (e.g., while loading)
    await Future.delayed(Duration(seconds: 2));

    // Close the loading popup
    Navigator.of(context).pop();

    // Update the language
    setState(() {
      currentLanguage = newLanguage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BAHASA"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text("Bahasa Saat Ini"),
                  Text(currentLanguage),
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _changeLanguage("Bahasa Indonesia");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Bahasa Indonesia"),
                        if (currentLanguage == "Bahasa Indonesia")
                          Icon(Icons.check, color: Colors.greenAccent),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      _changeLanguage("Bahasa Inggris");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Bahasa Inggris"),
                        if (currentLanguage == "Bahasa Inggris")
                          Icon(Icons.check, color: Colors.greenAccent),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
