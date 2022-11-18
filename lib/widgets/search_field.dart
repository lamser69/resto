import 'package:flutter/material.dart';

// Punya Ananda
class SearchField extends StatefulWidget {

  FocusNode? focusNode;
  bool? autofocus;
  TextEditingController? controller;

  SearchField({Key? key, this.autofocus, this.focusNode, this.controller})
      : super(key: key);
  @override
  _SearchField createState() => _SearchField();
}

class _SearchField extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: TextField(
        cursorColor: Colors.deepOrange,
        focusNode: widget.focusNode,
        controller: widget.controller,
        autofocus: widget.autofocus != null ? widget.autofocus! : false,
        decoration: const InputDecoration(
          hintText: 'Cari Restaurant ... ',
          prefixIcon: Icon(Icons.search, color: Colors.deepOrange),
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}