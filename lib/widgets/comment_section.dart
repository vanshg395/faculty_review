import 'package:flutter/material.dart';

import './faculty_overview.dart';

class CommentSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: FacultyOverview(),
        color: Colors.green,
      ),
    );
  }
}
