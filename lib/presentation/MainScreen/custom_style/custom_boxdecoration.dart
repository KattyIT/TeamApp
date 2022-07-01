import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration customBoxDecoration = BoxDecoration(
  boxShadow: const [
    BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
  ],
  gradient: const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0],
    colors: [Colors.teal, Colors.tealAccent],
  ),
  color: Colors.deepPurple.shade300,
  borderRadius: BorderRadius.circular(30),
);
