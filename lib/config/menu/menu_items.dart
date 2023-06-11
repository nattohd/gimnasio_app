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

const List<MenuItem> menuItems = [
  MenuItem(
    title: 'Mi perfil',
    subTitle: 'Configura tus datos personales',
    link: '/profile',
    icon: Icons.person_pin_sharp,
  ),
  MenuItem(
    title: 'Reservar Hora',
    subTitle: 'Encuentra horas disponibles para entrar al Gym',
    link: '/reserve',
    icon: Icons.calendar_month_outlined,
  ),
];
