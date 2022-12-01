import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search 801,991 games',
        hintStyle: const TextStyle(fontFamily: 'plusjarkata', fontSize: 15),
        filled: true,
        prefixIcon: const Icon(Icons.search),
        fillColor: const Color.fromARGB(61, 224, 224, 224),
        enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromARGB(61, 224, 224, 224)),
            borderRadius: BorderRadius.circular(30)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Color.fromARGB(61, 224, 224, 224),
          ),
        ),
      ),
    );
  }
}
