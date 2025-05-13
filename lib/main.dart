import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Nunito'),
    home: HomePage(),
  )
);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  final int totalPage = 4;

  void _onScroll() {}

  @override
  void initState() {
    _pageController = PageController(initialPage: 0)..addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage(
            page: 1,
            image: 'assets/images/one.jpg',
            title: 'Voleibol',
            description: '!Articulos para voleibol disponibles en nuestra tienda! :)',
          ),
          makePage(
            page: 2,
            image: 'assets/images/two.jpg',
            title: 'Redes y Accesorios',
            description: 'Ofeecemos diferentes tipos de materiales para entrenamientos :)',
          ),
          makePage(
            page: 3,
            image: 'assets/images/three.jpg',
            title: 'Basquetbol',
            description: "Vendemos articulos populares de basquetbol :)",
          ),
          makePage(
            page: 4,
            image: 'assets/images/four.jpg',
            title: 'Futbol',
            description: "Disponemos de diversos articulos para nuestro deporte mas demandado :)",
          ),
        ],
      ),
    );
  }

  Widget makePage({
    required String image,
    required String title,
    required String description,
    required int page,
  }) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: const [0.3, 0.9],
            colors: [
              // ignore: deprecated_member_use
              Colors.black.withOpacity(0.9),
              // ignore: deprecated_member_use
              Colors.black.withOpacity(0.2),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  FadeInUp(
                    child: Text(
                      page.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '/$totalPage',
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeInUp(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInUp(
                      child: Row(
                        children: <Widget>[
                          for (int i = 0; i < 4; i++)
                            const Padding(
                              padding: EdgeInsets.only(right: 3),
                              child: Icon(Icons.star, color: Colors.yellow, size: 15),
                            ),
                          const Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Icon(Icons.star, color: Colors.grey, size: 15),
                          ),
                          const Text('4.0', style: TextStyle(color: Colors.white70)),
                          const SizedBox(width: 5),
                          const Text('(2300)', style: TextStyle(color: Colors.white38, fontSize: 12)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInUp(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text(
                          description,
                          style: TextStyle(
                            // ignore: deprecated_member_use
                            color: Colors.white.withOpacity(0.7),
                            height: 1.9,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInUp(
                      child: Text('READ MORE', style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
