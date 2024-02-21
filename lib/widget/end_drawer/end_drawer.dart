import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_app/route/router_name_constant.dart';

class EndDrawerMenu extends StatefulWidget {
  const EndDrawerMenu({super.key});

  @override
  State<EndDrawerMenu> createState() => _EndDrawerMenuState();
}

class _EndDrawerMenuState extends State<EndDrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color.fromARGB(255, 158, 244, 235),
        child: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("SharKo Sharko"),
              accountEmail: const Text("SharokoSharko@gmail.com"),
              currentAccountPicture: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(80),
                  image: const DecorationImage(
                    image: AssetImage('assets/icons/moon_cloud.png'),
                    fit: BoxFit.cover,
                    scale: 0.2,
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  const Text(
                    "Giao dich xa hoi",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  ),
                  ListTile(
                    onTap: () => context.pushNamed(MyAppRouterName.thitruong),
                    leading: const Icon(
                      Icons.add_chart_rounded,
                      color: Colors.black54,
                      size: 24,
                    ),
                    title: const Text(
                      "Home",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    subtitle: const Text(
                      "Tang thu nhap bang cach chia se chien luoc cua ban",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  const Text(
                    "Giao dich xa hoi",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  ),
                  ListTile(
                    onTap: () => context.pushNamed(MyAppRouterName.themDanhMuc),
                    leading: const Icon(
                      Icons.add_chart_rounded,
                      color: Colors.black54,
                      size: 24,
                    ),
                    title: const Text(
                      "Them Danh Muc",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    subtitle: const Text(
                      "Tang thu nhap bang cach chia se chien luoc cua ban",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  const Text(
                    "Giao dich xa hoi",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  ),
                  ListTile(
                    onTap: () => context.pushNamed(MyAppRouterName.banggia),
                    leading: const Icon(
                      Icons.add_chart_rounded,
                      color: Colors.black54,
                      size: 24,
                    ),
                    title: const Text(
                      "Bang Gia",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    subtitle: const Text(
                      "Tang thu nhap bang cach chia se chien luoc cua ban",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () => context.pushNamed(MyAppRouterName.giaodich),
                    leading: const Icon(
                      Icons.add_chart_rounded,
                      color: Colors.black54,
                      size: 24,
                    ),
                    title: const Text(
                      "Giao dich",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    subtitle: const Text(
                      "Tang thu nhap bang cach chia se chien luoc cua ban",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () => null,
                    leading: const Icon(
                      Icons.add_chart_rounded,
                      color: Colors.black54,
                      size: 24,
                    ),
                    title: const Text(
                      "Chat truc tuyen",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    subtitle: const Text(
                      "Tang thu nhap bang cach chia se chien luoc cua ban",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.add_chart_rounded,
                      color: Colors.black54,
                      size: 24,
                    ),
                    title: const Text(
                      "De xuat mot tinh nang",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    subtitle: const Text(
                      "Tang thu nhap bang cach chia se chien luoc cua ban",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () => null,
                    leading: const Icon(
                      Icons.add_chart_rounded,
                      color: Colors.black54,
                      size: 24,
                    ),
                    title: const Text(
                      "Giay to phap ly",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    subtitle: const Text(
                      "Tang thu nhap bang cach chia se chien luoc cua ban",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () => null,
                    leading: const Icon(
                      Icons.add_chart_rounded,
                      color: Colors.black54,
                      size: 24,
                    ),
                    title: const Text(
                      "Home",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    subtitle: const Text(
                      "Tang thu nhap bang cach chia se chien luoc cua ban",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
