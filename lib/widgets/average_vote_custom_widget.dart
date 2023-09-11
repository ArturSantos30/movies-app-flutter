import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AverageVoteCustomWidget extends StatelessWidget {
  final double? voteAverage;

  const AverageVoteCustomWidget({super.key, this.voteAverage});

  @override
  Widget build(BuildContext context) {
    if (voteAverage == null){
      return const Text("No review Yet");
    }
    return Row(
      children: [
        const Icon(
          CupertinoIcons.heart_fill,
          color: Colors.red,
        ),
        const SizedBox(width: 8,),
        Text(
          voteAverage!.toStringAsFixed(2),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}