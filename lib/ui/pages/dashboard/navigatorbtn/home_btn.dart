import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:init_flutter/ui/components/card_small.dart';
import 'package:init_flutter/ui/components/graph_modal2.dart';
import 'package:init_flutter/ui/components/time_text.dart';
import 'package:init_flutter/ui/pages/dashboard/notification/notification.dart';

class HomeBtn extends StatefulWidget {
  const HomeBtn({Key? key}) : super(key: key);

  @override
  State<HomeBtn> createState() => _HomeBtnState();
}

class _HomeBtnState extends State<HomeBtn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                child: Text(
                  'Welcome Back,',
                  style: TextStyle(
                    color: Color(0xffADA4A5),
                    fontSize: 15,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                child: Text(
                  'Stefani Wong',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                  ),
                ),
              )
            ]),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationFitness())),
            icon: SvgPicture.asset(
              'assets/icons/notification3.svg',
              width: 25,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                // Usamos MediaQuery para hacer el ancho dependiente del tamaño de la pantalla
                width: MediaQuery.of(context).size.width * 0.95,
                // padding: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff9DCEFF),
                      Color(0xff92A3FD),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    // Expanded permite que esta columna tome el espacio disponible de forma proporcional
                    Expanded(
                      flex: 2, // Da más espacio a la columna de texto
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'BMI (Body Mass Index)',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'You have a normal weight',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.5,
                            ),
                          ),
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              width: 105,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xffEEA4CE),
                                    Color(0xffC58BF2),
                                  ],
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Learn More',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 10), // Espacio entre las columnas

                    // Flexible permite que la imagen se ajuste sin provocar desbordamiento
                    Flexible(
                      flex: 1, // La imagen ocupará menos espacio
                      child: Image.asset(
                        'assets/images/banner.png',
                        fit: BoxFit.contain,
                        height:
                            100, // Puedes ajustar la altura máxima si es necesario
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Activity Status',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(18),
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Color(0xffF7F8F8),
                      blurRadius: 10.0,
                    ),
                  ],
                  color: const Color(0xffE2E7FF),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Heart Rate',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '78 BPM',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff92A3FD)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(),
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xffEEA4CE),
                              Color(0xffC58BF2),
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '3mins ago',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      // Primer contenedor grande (Water Intake)
                      Container(
                        width: constraints.maxWidth >= 600
                            ? constraints.maxWidth * 0.58
                            : constraints.maxWidth,
                        padding: const EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xffF7F8F8),
                              blurRadius: 10.0,
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            // Barra lateral vertical (azul)
                            Container(
                              height: 290,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0xffF7F8F8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 150,
                                    width: 25,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(15),
                                        bottomLeft: Radius.circular(15),
                                      ),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xffB4C0FE),
                                          Color(0xffC58BF2),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),

                            // Texto + progreso
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Water Intake',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    '4 Liters',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff92A3FD),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Real time updates',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff7B6F72),
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  // Fila con imagen y textos horarios
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/progress.png',
                                        height: 100,
                                        width: 40,
                                        fit: BoxFit.contain,
                                      ),
                                      const SizedBox(width: 10),
                                      // Textos horarios
                                      const Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TimeText(),
                                            TimeText(),
                                            TimeText(),
                                            TimeText(),
                                            TimeText(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Columna de Sleep y Calories (cada uno con su contenedor)
                      SizedBox(
                        width: constraints.maxWidth >= 600
                            ? constraints.maxWidth * 0.38
                            : constraints.maxWidth,
                        child: const Column(
                          children: [
                            // Sleep Card
                            CardSmall(
                              title: 'Sleep',
                              subtitle: '8h 20m',
                              image: 'assets/images/sleep.png',
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Average Progress',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'See more',
                    style: TextStyle(color: Color(0xffADA4A5)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image.asset('assets/images/workout.png'),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Fullbody Workout",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '180 Calories Burn | 20minutes',
                          style: TextStyle(
                            color: Color(0xff7B6F72),
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GraphModal2(),
                      ],
                    ),
                  ),
                  Image.asset('assets/images/Workout-Btn.png'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image.asset('assets/images/workout2.png'),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Lowerbody Workout",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '200 Calories Burn | 30minutes',
                          style: TextStyle(
                            color: Color(0xff7B6F72),
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GraphModal2(),
                      ],
                    ),
                  ),
                  Image.asset('assets/images/Workout-Btn.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
