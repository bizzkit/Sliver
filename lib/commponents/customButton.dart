import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isSearchValid;

  const SearchButton({
    Key? key,
    this.onPressed,
    required this.isSearchValid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            isSearchValid ? Colors.green : Colors.grey,
          ),
          elevation: MaterialStateProperty.all<double>(4.0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide.none,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Искать",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white, 
            ),
          ),
        ),
      ),
    );
  }
}
