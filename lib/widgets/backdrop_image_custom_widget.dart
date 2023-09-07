import 'package:flutter/material.dart';
import 'package:simplemovieapp/utils/api_constants.dart';

class BackdropImageCustomWidget extends StatelessWidget {
  final String? backdropPath;
  const BackdropImageCustomWidget({super.key, this.backdropPath});

  @override
  Widget build(BuildContext context) {
    if (backdropPath != null){
      return Image.network(
        '${APIConstants.imagePath}$backdropPath',
        fit: BoxFit.cover,
        height: double.infinity,
      );
    }
    return Center(
        child: Image.asset('assets/not_found.png',color: Colors.white,)
    );
  }
}
