import 'package:flutter/material.dart';

abstract class ToggleBase extends StatelessWidget {
  Stream<bool> active = Stream.empty();
  Function() onclick = () => {};
  Icon icon = const Icon(Icons.question_mark);
}
