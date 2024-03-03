import 'package:flutter/material.dart';

import 'package:stock_app/services/api_chung_khoan_services.dart';

class BangGiaScreen extends StatefulWidget {
  const BangGiaScreen({Key? key}) : super(key: key);

  @override
  State<BangGiaScreen> createState() => _BangGiaScreenState();
}

class _BangGiaScreenState extends State<BangGiaScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 250,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/R.jfif'),
                          fit: BoxFit.cover)),
                )),
            Positioned(
                top: 200,
                child: Container(
                  padding: const EdgeInsets.only(top: 25, left: 16, right: 16),
                  width: MediaQuery.of(context).size.width,
                  height: 600,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.account_circle_outlined,
                            color: Colors.black,
                            size: 24,
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        color: Color.fromARGB(255, 203, 201, 201),
                        height: 5,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 60,
                        child: Stack(children: [
                          Positioned(
                              left: 0,
                              child: Container(
                                alignment: Alignment.center,
                                height: 60,
                                width: double.maxFinite,
                                child: const TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Mat khau',
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16),
                                    prefixIcon: Icon(
                                      Icons.lock_outline_rounded,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              )),
                          const Positioned(
                            right: 0,
                            top: 20,
                            child: Text(
                              "Quên mật khẩu ?",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(42, 110, 220, 1)),
                            ),
                          )
                        ]),
                      ),
                      const Divider(
                        thickness: 1,
                        color: Color.fromARGB(255, 203, 201, 201),
                        height: 10,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(42, 110, 220, 1),
                                fixedSize: const Size.fromWidth(300),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            child: const Text(
                              'Đăng nhập',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(
                            Icons.fingerprint,
                            size: 40,
                            color: Color.fromRGBO(42, 110, 220, 1),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Mở tài khoản",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(42, 110, 220, 1)),
                      ),
                      const SizedBox(
                        height: 180,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 25,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color:
                                          const Color.fromRGBO(42, 110, 220, 1),
                                      width: 2,
                                    )),
                                child: const Icon(
                                  Icons.stacked_bar_chart,
                                  size: 24,
                                  color: Color.fromRGBO(42, 110, 220, 1),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const Text(
                                'Thị trường',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          const Spacer(),
                          const Column(
                            children: [
                              Icon(
                                Icons.notification_important_outlined,
                                size: 40,
                                color: Color.fromRGBO(42, 110, 220, 1),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                'Thông báo',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          const Spacer(),
                          const Column(
                            children: [
                              Icon(
                                Icons.phone_in_talk_sharp,
                                size: 40,
                                color: Color.fromRGBO(42, 110, 220, 1),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                'Liên hệ',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                        ],
                      ),
                      Container(
                        height: 70,
                        alignment: Alignment.center,
                        child: const Text(
                          'Xem công bố rủi ro',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(42, 110, 220, 1)),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
