import '../index.dart';

class Result extends StatelessWidget {
  final double result;
  const Result({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Result'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Your Result",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              margin: const EdgeInsets.all(15.0),
              child: PrimaryCard(
                width: double.infinity,
                // height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (result >= 25) ...[
                      const ResultText(text: "OVERWEIGHT", color: Colors.red)
                    ] else if (result >= 18.5) ...[
                      const ResultText(text: "NORMAL", color: Colors.green)
                    ] else ...[
                      const ResultText(text: "UNDERWEIGHT", color: Colors.red)
                    ],
                    Text(
                      result.toStringAsFixed(2),
                      style: const TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (result >= 25) ...[
                      const Text(
                        "You have higher weight. Exercise More!",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ] else if (result >= 18.5) ...[
                      const Text(
                        'You have Normal Weight. Congratulations :)',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ] else ...[
                      const Text(
                        'Eat More to increase your weight. You are Underweight.',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const PrimaryButton(
                title: 'RE-CALCULATE',
                height: 70,
                width: double.infinity,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ResultText extends StatelessWidget {
  final String text;
  final Color color;
  const ResultText({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 20, color: color, fontWeight: FontWeight.bold),
    );
  }
}
