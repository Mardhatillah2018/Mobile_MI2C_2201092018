import 'package:flutter/material.dart';
import 'package:mi2c_mobile/screen_page/detail_grid.dart';
// import 'package:flutter_basic/detail_grid.dart';

class PageCustomeGrid extends StatefulWidget {
  const PageCustomeGrid({super.key});

  @override
  State<PageCustomeGrid> createState() => PageCustomeGridState();
}

class PageCustomeGridState extends State<PageCustomeGrid> {
  List<Map<String, dynamic>> listMovie = [
    {
      "judul": "The Philosopher's Stone",
      "gambar": "film1.jpg",
      "harga": 45000,
    },
    {
      "judul": "Beauty and The Beast",
      "gambar": "film2.jpg",
      "harga": 35000,
    },
    {
      "judul": "Train To Busan",
      "gambar": "film3.jpg",
      "harga": 50000,
    },
    {
      "judul": "Spiderman No Way Home",
      "gambar": "film4.jpg",
      "harga": 45000,
    },
    {
      "judul": "Avatar The Way Of Water",
      "gambar": "film5.jpg",
      "harga": 35000,
    },
    {
      "judul": "Frozen",
      "gambar": "film6.jpg",
      "harga": 45000,
    },
    {
      "judul": "Zootopia",
      "gambar": "film7.jpg",
      "harga": 45000,
    },
    {
      "judul": "Lion King",
      "gambar": "film8.jpg",
      "harga": 35000,
    },
    {
      "judul": "The Secret Of Dumbledore",
      "gambar": "film9.jpg",
      "harga": 50000,
    },
    {
      "judul": "Maleficent",
      "gambar": "film10.jpg",
      "harga": 45000,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custome Grid"),
        backgroundColor: Colors.blueGrey,
      ),
      body: GridView.builder(
          itemCount: listMovie.length,
          gridDelegate: const
          SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            DetailGrid(listMovie[index])));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridTile(
                    footer: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color:
                          Colors.black)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${listMovie[index]["judul"]}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text("Rp. ${listMovie[index]["harga"]}")
                        ],
                      ),
                    ),
                    child:
                    Image.asset("gambar/${listMovie[index]["gambar"]}")),
              ),
            );
          }),
    );
  }
}