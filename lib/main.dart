import 'package:flutter/material.dart';
import 'package:morse_to_text/services/morse_to_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Morse Translator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Morse Translator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _textController;

  bool isMorse = true;
  String transText = "";

  @override
  void initState() {
    _textController = TextEditingController();

    super.initState();
  }

  translate(String text) {
    if (isMorse) {
      setState(() {
        transText = MorseAndText().morseToText(text: text);
      });
    }

    setState(() {
      transText = MorseAndText().textToMorse(morse: text);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              isMorse = !isMorse;
              _textController.text = "";
              transText = "";
            });
          },
          tooltip: "Change from Morse to Text and vise versa",
          child: Text(isMorse ? "Text" : "Morse"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 30,
            bottom: 5,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _textController,
                  maxLines: 5,
                  onChanged: (value) {
                    translate(value);
                  },
                  onSubmitted: (value) {
                    translate(value);
                  },
                  decoration: InputDecoration(
                    hintText: isMorse ? "Enter Text" : "Enter Morse code",
                    labelText: isMorse ? "Enter Text" : "Enter Morse code",
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "To",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.maxFinite,
                  height: deviceSize.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(90, 151, 214, 243),
                  ),
                  child: Text(
                    transText,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
