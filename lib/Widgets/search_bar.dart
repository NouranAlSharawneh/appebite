import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:appebite/Widgets/RecipesList.dart';
import 'package:appebite/filteredrecipes.dart';

class SearchBar1 extends StatefulWidget {
  const SearchBar1({
    Key? key,
  }) : super(key: key);

  @override
  _SearchBar1State createState() => _SearchBar1State();
}

class _SearchBar1State extends State<SearchBar1> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(250, 38, 40, 48),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                offset: const Offset(0, 4),
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.72),
                inset: true,

              ),
            
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
  controller: _controller,
  onSubmitted: (String value) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FilteredPage()),
    );
  },
  style: const TextStyle(color: Colors.white),
  decoration: const InputDecoration(
    border: InputBorder.none,
    hintText: "Search recipe",
    hintStyle: TextStyle(
      color: Color.fromARGB(255, 104, 111, 130),
      fontFamily: 'Poppins',
      fontSize: 13,
    ),
    prefixIcon: Icon(Iconsax.search_normal_1_copy,
        color: Color.fromARGB(255, 104, 111, 130)),
    suffixIcon: Padding(
      padding: EdgeInsets.only(right: 13),
      child: Icon(
        IconlyLight.filter,
        color: Color(0xffff7269),
      ),
    ),
  ),
)
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
