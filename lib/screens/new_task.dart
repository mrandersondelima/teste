import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hora_do_foco/controllers/page_view_controller.dart';
import 'package:hora_do_foco/screens/new_task_details.dart';

class NewTask extends StatefulWidget {
  const NewTask({
    super.key,
  });

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final _pageViewController = Get.find<PageViewController>();

  double _containerSize = 0.0;
  late double _screenSize = 0;

  @override
  void initState() {
    super.initState();
    _screenSize = MediaQuery.of(Get.context!).size.height;
    _containerSize = _screenSize * 90 / 100;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // behavior: HitTestBehavior.deferToChild,
      onVerticalDragEnd: (details) {
        if (_containerSize < _screenSize * 80 / 100) {
          Get.bottomSheet(
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextButton(
                        style: const ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          backgroundColor: WidgetStatePropertyAll(
                            Color(0xFF303030),
                          ),
                        ),
                        onPressed: () {
                          Get.back();
                          Get.back();
                        },
                        child: const Text(
                          'Descartar Alterações',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextButton(
                        style: const ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          backgroundColor: WidgetStatePropertyAll(
                            Color(0xFF303030),
                          ),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      ),
                    ],
                  )),
              barrierColor: Colors.black.withAlpha(100),
              isDismissible: true,
              enableDrag: false,
              backgroundColor: Colors.transparent);
        }
        setState(() {
          _containerSize = _screenSize * 90 / 100;
        });
      },
      onVerticalDragUpdate: (details) {
        if (_screenSize - details.globalPosition.dy >= _screenSize * 80 / 100) {
          setState(() {
            _containerSize = _screenSize - details.globalPosition.dy;
          });
        } else {
          setState(() {
            _containerSize = _containerSize - 0.5;
          });
        }
      },
      child: Container(
        height: _containerSize,
        child: PageView(
          allowImplicitScrolling: false,
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageViewController.pageViewController,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0)),
                        child: const Text(
                          "Cancelar",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      const Text(
                        "Nova Tarefa",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: null,
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0)),
                        child: const Text(
                          "Adicionar",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              color: const Color(0xFF303030),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "Título",
                                  hintStyle: TextStyle(
                                    color: Colors.white.withAlpha(100),
                                    fontSize: 14,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsets.only(left: 10),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  height: 0.3,
                                  color: Colors.white,
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "Descrição",
                                  hintStyle: TextStyle(
                                    color: Colors.white.withAlpha(100),
                                    fontSize: 14,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsets.only(left: 10),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      _pageViewController.pageViewController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF303030),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Detalhes"),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            NewTaskDetails()
          ],
        ),
      ),
    );
  }
}
