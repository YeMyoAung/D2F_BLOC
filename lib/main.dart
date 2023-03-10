import 'package:bloc_example/bloc/bloc_last.dart';
import 'package:bloc_example/bloc/counter_bloc.dart';
import 'package:bloc_example/observer/observer_example.dart';
import 'package:bloc_example/screen/counter_bloc_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///Pro
///Generic Type ဟုတ်မဟုတ်သိနိုင်မဲ့အချက်(build-inလည်းမပါဘူး,Implementလုပ်ထားခြင်းလည်းမရှိဘူး)(Data Typeသတ်မှတ်တဲ့အလုပ်လုပ်တယ်)
///
///
///Variable,T = dynamic,return => Null
///T = String
///Stream.periodic(Duration period,[T computation(int computationCount)?])
///
///Be
///return data typeက voidဟုတ်မဟုတ်ကြည့်လိုက်
///voidကလွဲရင် ကျန်တာအားလုံးမှာ return dataရှိတယ်လို့မှတ်ရမယ်
void main() {
  Bloc.observer = ObserverExample();
  // i++
  // Bloc.observer = fjslfjal();
  ///ToDo::
  // Bloc.transformer = droppable();

  // Stream.periodic(); => return data
  // Future.delayed();  => return data
  // Future.any(); => reutrn data

  runApp(const MyApp());

  ///void => return data
}

void fdsajkl() {}

void afdsa() {}

// class Person extends Equatable {
//   final String name;
//   final int age;
//   final DateTime dob;
//   final Map parents;
//
//   Person({
//     required this.name,
//     required this.age,
//     required this.dob,
//     required this.parents,
//   });
//
//   @override
//   List<Object?> get props => [name, age];
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final Person person1 =
    //     Person(name: 'name', age: 2, dob: DateTime(2000), parents: {});
    // final Person person2 =
    //     Person(name: 'name', age: 2, dob: DateTime(2000), parents: {});
    // print(person1 == person2);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => CounterBloc(0),
          ),
          BlocProvider(
              create: (_) => PredictBloc(DefaultState(
                      isLoading: false,
                      color: Colors.grey,
                      message: "Let's Predict",
                      values: const {
                        0: 0,
                        1: 0,
                        2: 0,
                        3: 0,
                        4: 0,
                        5: 0,
                      }))),
          BlocProvider(
              create: (_) => CounterBlocWithMultiEvent(DefaultCounterState(0))),
          // BlocProvider(
          //   create: (_) => CubitLast(
          //     PredictState(
          //         color: Colors.grey,
          //         isLoading: false,
          //         message: "Let's Predict"),
          //   ),
          // ),
        ],
        child: const CounterBlocExample(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
