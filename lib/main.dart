import 'package:flutter/material.dart';
import 'package:flutter_string_encryption/flutter_string_encryption.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _minimumPadding = 5.0;
  TextEditingController plainTextController = TextEditingController();
  TextEditingController cipherTextController = TextEditingController();
  var displayResult1 = '';
  var displayResult2 = '';
/* @override
  initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    final cryptor = new PlatformStringCryptor();

    final key = await cryptor.generateRandomKey();
    print("randomKey: $key");

    final string = "here is the string, here is the string.";
    final encrypted = await cryptor.encrypt(string, key);
    final decrypted = await cryptor.decrypt(encrypted, key);

    assert(decrypted == string);

    final wrongKey =
        "jIkj0VOLhFpOJSpI7SibjA==:RZ03+kGZ/9Di3PT0a3xUDibD6gmb2RIhTVF+mQfZqy0=";

    try {
      await cryptor.decrypt(encrypted, wrongKey);
    } on MacMismatchException {
      print("wrongly decrypted");
    }

    final salt = "Ee/aHwc6EfEactQ00sm/0A=="; // await cryptor.generateSalt();
    final password = "a_strong_password%./😋";
    final generatedKey = await cryptor.generateKeyFromPassword(password, salt);
    print("salt: $salt, key: $generatedKey");

    assert(generatedKey == wrongKey);

    setState(() {
      _randomKey = key;
      _string = string;
      _encrypted = encrypted;
      _decrypted = decrypted;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.bodyText1;
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        accentColor: Colors.orangeAccent,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('My Encryption Algorithm'),
        ),
        body: new Container(
          padding: EdgeInsets.all(_minimumPadding * 2),
          child: ListView(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextField(
                style: textStyle,
                controller: plainTextController,
                decoration: InputDecoration(
                    labelText: 'Plain Text',
                    labelStyle: textStyle,
                    hintText: 'Enter your plain text e.g nash',
                    hintStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextField(
                style: textStyle,
                controller: cipherTextController,
                decoration: InputDecoration(
                    labelText: 'Cipher Text',
                    labelStyle: textStyle,
                    hintText: 'Enter your cipher text e.g Jkl4op!',
                    hintStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                        child: Text(
                          'Encrypt',
                          style: textStyle,
                        ),
                        elevation: 6.0,
                        color: Colors.orangeAccent,
                        onPressed: () {
                          setState(() {
                            _encrypt();
                          });
                        }),
                  ),
                  Expanded(
                    child: RaisedButton(
                        child: Text(
                          'Decrypt',
                          style: textStyle,
                        ),
                        elevation: 6.0,
                        color: Colors.greenAccent,
                        onPressed: () {
                          setState(() {
                            _decrypt();
                          });
                        }),
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.all(_minimumPadding * 2),
                child: Text(
                  'Cipher:'+ ' ' + this.displayResult1,
                  style: TextStyle(color:Colors.orangeAccent, fontSize: 20.0),
                )),
            Padding(
                padding: EdgeInsets.all(_minimumPadding * 2),
                child: Text(
                'Plain Text:' + ' ' + this.displayResult2,
                  style: TextStyle(color: Colors.greenAccent, fontSize: 20.0),
                )),
                RaisedButton(
                  child: Text(
                          'Reset',
                          style: textStyle,
                        ),
                        elevation: 6.0,
                        color: Colors.green,
                  onPressed: (){
                    _reset();
                                      })
                              ]),
                            ),
                          ),
                        );
                      }
                    
                      _encrypt() async {
                        var cryptor = new PlatformStringCryptor();
                        var key = await cryptor.generateRandomKey();
                        print("randomKey: $key");
                        var string = plainTextController.text;
                        var encrypted = await cryptor.encrypt(string, key);
                        setState(() {
                          displayResult1 = encrypted;
                        });
                      }
                    
                      _decrypt() async {
                        var cryptor = new PlatformStringCryptor();
                        var key = await cryptor.generateRandomKey();
                        print("randomKey: $key");
                        var string = plainTextController.text;
                        var encrypted = await cryptor.encrypt(string, key);
                        var decrypted = await cryptor.decrypt(encrypted, key);
                        assert(decrypted == string);
                        final wrongKey =
                            "jIkj0VOLhFpOJSpI7SibjA==:RZ03+kGZ/9Di3PT0a3xUDibD6gmb2RIhTVF+mQfZqy0=";
                        try {
                          await cryptor.decrypt(encrypted, wrongKey);
                        } on MacMismatchException {
                          print("wrongly decrypted");
                        }
                        setState(() {
                          displayResult2 = decrypted;
                        });
                      }
                    
                      void _reset() {
                        cipherTextController.text= '';
                        plainTextController.text = '';
                        displayResult1 = '';
                        displayResult2 = '';
                      }
}
