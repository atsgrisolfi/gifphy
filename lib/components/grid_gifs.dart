import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../models/gif.dart';

class GridGifs extends StatelessWidget {
 
  final List<GifModel> gifs;
  const GridGifs(this.gifs, {Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return GridView.builder(
        itemCount: gifs.length,
        itemBuilder: (_,index){
          final gif=gifs[index];
        

        return FadeInImage.memoryNetwork(
          placeholder: kTransparentImage, 
          image: gif.url,
          );
        }, gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
       );
  }
}