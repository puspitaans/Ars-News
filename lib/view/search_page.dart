import 'package:ars_news/model/berita.dart';
import 'package:flutter/material.dart';

import 'detail_berita.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredData = [];
  List<String> _data = [];
  bool _isLoading = false;
  String searchString = "";

  Future<void> _performSearch() async {
    setState(() {
      _isLoading = true;
    });

    //Simulates waiting for an API call
    await Future.delayed(const Duration(milliseconds: 1000));

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            setState(() {
              searchString = value.toString();
            });
          },
          controller: _searchController,
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: const InputDecoration(
            hintText: 'Cari Berita...',
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
          ),
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            )
          : ListView.builder(
              itemCount: listBerita.length,
              itemBuilder: (context, index) => listBerita[index]
                      .judul
                      .toLowerCase()
                      .contains(searchString.toLowerCase())
                  ? ListTile(
                      title: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailBerita(
                              berita: listBerita[index],
                            );
                          }));
                        },
                        child: Text(
                          listBerita[index].judul,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                  : Container()),
      backgroundColor: Colors.white,
    );
  }
}
