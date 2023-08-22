import 'package:flutter/material.dart';



// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  String title;
   HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Ecommerce"),
        centerTitle: true,
      ),
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(currentIndex: currentIndex,
      onTap: (value) {
        print("Current value: $value");
        currentIndex = value;
        setState(() {
          
        });
      },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart"),
        ]
      ),
    );
  }
}
// class SecondScreen extends StatelessWidget {
//   String title;
//    SecondScreen({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("title"),
//       ),
//     );
//   }
// }