import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../themes/styles.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key, required this.controller, required this.focusNode});

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              const Icon(Icons.search,
              ),
              const SizedBox(width: 8,),
              Expanded(
                child: 
                TextField(controller: controller,
                focusNode: focusNode,
                style: Styles.searchText,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',),
                )
              ),
              IconButton(
                icon: const Icon(Icons.clear),
                onPressed: controller.clear,
              )
            ],
          ),
        ),
      ),
    );
  }
}