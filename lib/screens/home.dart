import 'package:flutter/cupertino.dart';

import '../index.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double height = 180;
  double weight = 63;
  int age = 18;
  Color maleCardColor = AppColors.selectedColor;
  Color femaleCardColor = AppColors.unSelectedColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        maleCardColor = AppColors.selectedColor;
                        femaleCardColor = AppColors.unSelectedColor;
                      });
                    },
                    child: GenderCard(
                      title: 'MALE',
                      icon: Icons.male,
                      color: maleCardColor,
                      height: 200,
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        femaleCardColor = AppColors.selectedColor;
                        maleCardColor = AppColors.unSelectedColor;
                      });
                    },
                    child: GenderCard(
                      title: 'FEMALE',
                      icon: Icons.female,
                      color: femaleCardColor,
                      height: 200,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          Expanded(
            child: PrimaryCard(
              margin: const EdgeInsets.all(12.0),
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        height.round().toString(),
                        style: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'CM',
                        style: TextStyle(
                            fontSize: 15.0, color: AppColors.lightGrey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Slider(
                    value: height,
                    max: 300,
                    min: 70,
                    activeColor: AppColors.pinky,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          Row(
            children: [
              Expanded(
                child: PrimaryCard(
                  margin: const EdgeInsets.all(12.0),
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: AppColors.lightGrey,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Text(
                        weight.round().toString(),
                        style: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundedIconButton(
                            icon: Icons.remove,
                            onTap: () {
                              if (weight > 1) {
                                setState(() {
                                  weight--;
                                });
                              }
                            },
                          ),
                          RoundedIconButton(
                            icon: Icons.add,
                            onTap: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15.0),
              Expanded(
                child: PrimaryCard(
                  margin: const EdgeInsets.all(12.0),
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: AppColors.lightGrey,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Text(
                        age.toString(),
                        style: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundedIconButton(
                            icon: Icons.remove,
                            onTap: () {
                              if (age > 18) {
                                setState(() {
                                  age--;
                                });
                              }
                            },
                          ),
                          RoundedIconButton(
                            icon: Icons.add,
                            onTap: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 15.0),
          GestureDetector(
            onTap: () {
              double bmiResult = calculateBMI(height: height, weight: weight);
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) {
                    return Result(
                      result: bmiResult,
                    );
                  },
                ),
              );
            },
            child: const PrimaryButton(
              title: 'CALCULATE',
              height: 80,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final double height;
  final double width;

  const PrimaryButton({
    Key? key,
    required this.title,
    required this.height,
    required this.width,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        color: AppColors.pinky,
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
