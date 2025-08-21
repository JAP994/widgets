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
    title: 'Buttons',
    subTitle: 'Varios Botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),

  MenuItem(
    title: 'Cards',
    subTitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),

  MenuItem(
    title: 'About',
    subTitle: 'Un contenedor about',
    link: '/about',
    icon: Icons.abc_outlined,
  ),

  MenuItem(
    title: 'Progress Indicators',
    subTitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),

  MenuItem(
    title: 'Snackbars y dialogos',
    subTitle: 'Indicadores en pantallar',
    link: '/snackbars',
    icon: Icons.info_outline,
  ),

  MenuItem(
    title: 'Animated container',
    subTitle: 'Stateful widget animado',
    link: '/animated',
    icon: Icons.check_box_outline_blank_outlined,
  ),

  MenuItem(
    title: 'UI Controls + Tiles',
    subTitle: 'Una serie de controles de Flutter',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined,
  ),

  MenuItem(
    title: 'Introduccion a la aplicacion',
    subTitle: 'Pequeno tutorial instroductorio',
    link: '/tutorial',
    icon: Icons.accessible_rounded,
  ),
];
