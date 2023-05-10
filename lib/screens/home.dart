import 'package:flutter/material.dart';
import 'package:mad_assign/screens/Welcome.dart';
import '../services/firebase_services.dart';
import 'LoginScreen.dart';

class Cake {
  final String name;
  final String image;
  final String weight;
  final String price;
  final bool inStock;

  Cake({required this.name, required this.image, required this.price, required this.weight,required this.inStock});
}

List<Cake> cakes = [
  Cake(name: 'Ferrero Rocher Cake',image: 'https://layers.pk/wp-content/uploads/2021/11/ferrero-square.jpg',weight:'2.5 LBS',  price: 'Rs 2,600',inStock:true),
  Cake(name: 'Lotus Cake', image: 'https://images.deliveryhero.io/image/fd-pk/LH/p5xl-hero.jpg' ,weight:'2.5 LBS',price: 'RS 2,500',inStock:true),
  Cake(name: 'Red Velvet Cake', image: 'https://layers.pk/wp-content/uploads/elementor/thumbs/Red-Velvet-pgtfyyk6xhe65coo8lw8t565c7ao96nw0ittufdpc8.jpg',weight:'2.5 LBS',price: 'RS 1,700',inStock:true),
  Cake(name: 'Nutella Cake', image:  'https://layers.pk/wp-content/uploads/2021/11/Nutella.jpg',weight:'2.5 LBS',price: 'RS 1,900',inStock:true),
];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _sortingOption = 'Name';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layers',

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Layers'),
backgroundColor: Color(0xFFBCA36C),
          actions: [

            IconButton(
              onPressed:() async {
                await FirebaseServices().googleSignOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              icon: Icon(Icons.logout),
            ),



            PopupMenuButton<String>(
              onSelected: (String value) {
                setState(() {
                  _sortingOption = value;
                  switch (_sortingOption) {
                    case 'Price':
                      cakes.sort((a, b) => a.price.compareTo(b.price));
                      break;
                    case 'Weight':
                      cakes.sort((a, b) => a.weight.compareTo(b.weight));
                      break;
                    default:
                      cakes.sort((a, b) => a.name.compareTo(b.name));
                      break;
                  }
                });
              },
              itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Name',
                  child: Text('Name'),
                ),
                const PopupMenuItem<String>(
                  value: 'Price',
                  child: Text('Price'),
                ),
                const PopupMenuItem<String>(
                  value: 'Weight',
                  child: Text('Weight'),
                ),
              ],
            ),
          ],
        ),
        body: Scrollbar(
          child: ListView.builder(
            itemCount: cakes.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(

                child: Column(
                  children: [
                    Image.network(cakes[index].image,  ),
                    const SizedBox(height: 10),
                    Text(
                      cakes[index].name,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      cakes[index].price,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 100,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFBCA36C), // set the background color
                          elevation: 5.0, // set the elevation

                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CakeDetailScreen(cake: cakes[index])));
                        },
                        child: const Text('View'),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CakeDetailScreen extends StatelessWidget {
  final Cake cake;

  const CakeDetailScreen({required this.cake});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cake Details'),
        backgroundColor: Color(0xFFBCA36C),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Image.network(
            cake.image,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Text(
            cake.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            cake.price,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            cake.weight,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            cake.inStock ? 'In Stock' : 'Out of Stock',
            style: TextStyle(fontSize: 18, color: cake.inStock ? Colors.green : Colors.red),
          ),
        ],
      ),
    );
  }
}