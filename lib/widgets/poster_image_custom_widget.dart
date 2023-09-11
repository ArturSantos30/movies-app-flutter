import 'package:flutter/material.dart';

import '../utils/api_constants.dart';

class PosterImageCustomWidget extends StatelessWidget {
  final String? posterPath;

  const PosterImageCustomWidget({super.key, this.posterPath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      width: 50.0,
      child: (posterPath != null)
          ? Image.network('${APIConstants.imagePath}$posterPath')
          : Image.asset('assets/not_found.png', color: Colors.white,),
    );
  }
}