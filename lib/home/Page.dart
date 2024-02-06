import 'package:aprendendo/components/grid_gifs.dart';
import 'package:aprendendo/home/Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomePageController> {
   
   
   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Home Page'),),
           body: controller.obx(
            
             (state)=> GridGifs( state!, key: null),
             onLoading: const Center(child: CircularProgressIndicator(),),
             onError: (error) => Text(error.toString()),
             

           ),
       );
  } 
}