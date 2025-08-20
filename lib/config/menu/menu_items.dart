import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

   const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[

  MenuItem(
    title: 'Buttons' ,
    subTitle: 'Varios Botones en Flutter' ,
    link: '/buttons' ,
    icon: Icons.smart_button_outlined,
  ),

  MenuItem(
    title: 'Cards' ,
    subTitle: 'Un contenedor estilizado' ,
    link: '/cards' ,
    icon: Icons.credit_card,
  ),

  MenuItem(
    title: 'About',
    subTitle: 'Un contenedor about', 
    link: '/about', 
    icon: Icons.abc_outlined
  ),

  MenuItem(
    title: 'ProgressIndicators',
    subTitle: 'Generales y controlados', 
    link: '/progress', 
    icon: Icons.refresh_rounded
  ),

];
