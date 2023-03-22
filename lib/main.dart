import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "tf",
      options: FirebaseOptions(
          apiKey: "AIzaSyDU_mrMLU45qz1qh0Qn8_IXW74h5vV4q50",
          appId: "1:427148287249:android:5d5dd1015cf6a90fcd00b0",
          messagingSenderId: "427148287249",
          projectId: "templefinder-b76ef"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const customSwatch = MaterialColor(
    0xFFFF5252,
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(0xFFFF5252),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    },
  );

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: customSwatch,
      ),
      debugShowCheckedModeBanner: false,
      home: const loginpage(),
    );
  }
}

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  var username = new TextEditingController();
  var password = new TextEditingController();
  var invalidUsername = false;
  var invalidPassword = false;
  String temp = "";
  bool password_visible = true, passworderror = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 200,
        title: Center(
            child: const Text(
          "Temple Finder",
          style: TextStyle(fontSize: 32, fontFamily: 'Raleway'),
        )),
      ), 
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 125.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(flex: 1, child: Text("")),
                    Expanded(
                      flex: 5,
                      child: Container(
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: Container(
                                    child: TextField(
                                      onChanged: (s) {
                                        setState(() {
                                          temp = s;
                                        });
                                        if (username.text == "" &&
                                            password.text == "") {
                                          invalidUsername = true;
                                          invalidPassword = true;
                                        }
                                        if (!username.text
                                            .contains("@bitsathy.ac.in")) {
                                          invalidUsername = true;
                                          setState(() {
                                            username =
                                                false as TextEditingController;
                                          });
                                        } else {
                                          setState(() {
                                            username =
                                                true as TextEditingController;
                                          });
                                        }
                                      },
                                      controller: username,
                                      decoration: InputDecoration(
                                        // errorText:
                                        //     (invalidUsername) ? "Invaid" : null,
                                        border: UnderlineInputBorder(),
                                        labelText: 'Email',
                                      ),
                                    ),
                                  ),
                                ),
                                // Expanded(flex:3,child: Container(width: double.infinity,)),
                              ],
                            )),
                      ),
                    ),
                    Expanded(flex: 1, child: Text("")),
                  ],
                ),
                Row(
                  children: [
                    Expanded(flex: 1, child: Text("")),
                    Expanded(
                      flex: 5,
                      child: Container(
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: Container(
                                    child: TextField(
                                      obscureText: password_visible,
                                      controller: password,
                                      decoration: InputDecoration(
                                        errorText:
                                            (invalidPassword) ? "Invaid" : null,
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                password_visible =
                                                    !password_visible;
                                              });
                                            },
                                            icon: password_visible
                                                ? Icon(
                                                    Icons.remove_red_eye,
                                                    color: Colors.grey,
                                                  )
                                                : Icon(Icons.remove_red_eye)),
                                        border: UnderlineInputBorder(),
                                        labelText: 'Password',
                                      ),
                                    ),
                                  ),
                                ),
                                // Expanded(flex:3,child: Container(width: double.infinity,)),
                              ],
                            )),
                      ),
                    ),
                    Expanded(flex: 1, child: Text("")),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => religion_page()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 75, 0, 0),
                    child: Container(
                      width: 100,
                      height: 50,
                      color: Colors.black,
                      child: Center(
                        child: (Text(
                          '𝐋𝐎𝐆𝐈𝐍',
                          style: TextStyle(
                              backgroundColor: Colors.black,
                              fontSize: 20,
                              color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class religion_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
            child: Text(
          'Temple Finder',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()))
                            },
                            child: Container(
                              width: currentWidth * 0.4,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Card(
                                      child: Image(
                                        image: AssetImage('assets/hindu.jpg'),
                                        height: 250,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 0, 10),
                                      child: Text(
                                        'HINDU TEMPLE',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()))
                            },
                            child: Container(
                              width: currentWidth * 0.4,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Card(
                                      child: Image(
                                        image: AssetImage('assets/christ.png'),
                                        height: 250,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 0, 10),
                                      child: Text(
                                        'CHRISTIAN TEMPLE',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyHomePage()))
                                },
                                child: Container(
                                  width: currentWidth * 0.4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Card(
                                          child: Image(
                                            image:
                                                AssetImage('assets/muslim.jpg'),
                                            height: 250,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 10),
                                          child: Text(
                                            'MUSLIM TEMPLE',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()))
                            },
                            child: Container(
                              width: currentWidth * 0.4,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Card(
                                      child: Image(
                                        image: AssetImage('assets/budda.jpg'),
                                        height: 250,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 0, 10),
                                      child: Text(
                                        'BUDDHA TEMPLE',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var templename = '';
  List<String> templenames = [];
  List<String> templeimgurls = [];
  List<String> templeDescription = [];
  List<String> temple360view = [];
  List<String> states = ["Tamil Nadu", "Karnataka", "Kerala", 'Andhra Pradesh'];
  getTemples() async {
    print("In get temples");
    for (var i in states) {
      await FirebaseDatabase.instance.ref("Hindu").child(i).get().then((value) {
        var iter = value.children.iterator;
        while (iter.moveNext()) {
          var data = iter.current.child("name").value.toString();
          templenames.add(data);
          templeimgurls.add(iter.current.child("url").value.toString());
          templeDescription
              .add(iter.current.child("description").value.toString());
          temple360view.add(iter.current.child("360url").value.toString());
        }
        setState(() {});
      });
    }
  }

  @override
  void initState() {
    getTemples();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: const Text("Temple Finder")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            DropdownSearch<String>(
              mode: Mode.MENU,
              showSelectedItems: true,
              items: ["Tamil Nadu", "Karnataka", "Kerala", 'Andhra Pradesh'],
              dropdownSearchDecoration: InputDecoration(
                labelText: "Select State",
                hintText: "State in menu mode",
              ),

              onChanged: itemSelectionChanged,
              //selectedItem: "",
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                cursorColor: Colors.blue,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: templenames.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => hindu_temple(
                                  templenames.elementAt(index),
                                  templeDescription.elementAt(index),
                                  temple360view.elementAt(index))))
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 450,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            children: [
                              Card(
                                child: Image(
                                  image: NetworkImage(templeimgurls[index]),
                                  height: 150,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                                child: Center(
                                  child: Text(
                                    templenames.elementAt(index),
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  bool isItemDisabled(String s) {
    //return s.startsWith('I');

    if (s.startsWith('I')) {
      return true;
    } else {
      return false;
    }
  }

  void itemSelectionChanged(String? s) async {
    await FirebaseDatabase.instance
        .ref("Hindu")
        .child(s.toString())
        .get()
        .then((value) {
      templenames.clear();
      templeimgurls.clear();
      templeDescription.clear();
      temple360view.clear();
      var iter = value.children.iterator;
      while (iter.moveNext()) {
        var data = iter.current.child("name").value;
        templenames.add(data.toString());
        templeimgurls.add(iter.current.child("url").value.toString());
        templeDescription
            .add(iter.current.child("description").value.toString());
        temple360view.add(iter.current.child("360url").value.toString());
      }
      setState(() {});
    });
  }
}

class hindu_temple extends StatefulWidget {
  final String templename;
  final String templeDescription;
  final String temple360view;
  const hindu_temple(
      this.templename, this.templeDescription, this.temple360view,
      {super.key});

  @override
  State<hindu_temple> createState() => _hindu_templeState();
}

class _hindu_templeState extends State<hindu_temple> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.templename),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(

              children: [
                Container(
                  height: 300,
                  child: Panorama(
                    
                    child: Image(image: NetworkImage(widget.temple360view)),
                  ),
                ),
              ],
            ),
            Container(
              height: 100,
              width: currentWidth,
              color: Colors.white,
              child: Center(
                child: Text(
                  widget.templename,
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Container(
              child: Text(
                '𝙃𝙄𝙎𝙏𝙊𝙍𝙔 𝙊𝙁 𝙏𝙀𝙈𝙋𝙇𝙀',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Text(
                  widget.templeDescription,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class muslim_temple extends StatefulWidget {
  const muslim_temple({super.key});

  @override
  State<muslim_temple> createState() => _muslim_templeState();
}

class _muslim_templeState extends State<muslim_temple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Muslim Temple'),
        ),
        body: Text('Hello'));
  }
}

class christian_temple extends StatefulWidget {
  const christian_temple({super.key});

  @override
  State<christian_temple> createState() => _christian_templeState();
}

class _christian_templeState extends State<christian_temple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Christian Temple'),
      ),
    );
  }
}

class abcd extends StatefulWidget {
  const abcd({super.key});

  @override
  State<abcd> createState() => _abcdState();
}

class _abcdState extends State<abcd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('abcd'),
      ),
      body: Text('Hello'),
    );
  }
}
