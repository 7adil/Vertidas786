import 'dart:async';
import 'package:flutter/material.dart';

class WorkersSliders extends StatefulWidget {
  const WorkersSliders({super.key});

  @override
  _WorkersSlidersState createState() => _WorkersSlidersState();
}

class _WorkersSlidersState extends State<WorkersSliders> {
  final List<String> imagePaths1 = [
    'assets/images/1ae1eb4_1c164dcfedbd43b3bf4a07321e1aa7f0mv2.jpeg',
    'assets/images/2ae1eb4_af67e1d819654085973d8da055301e93mv2.jpg',
    'assets/images/3ae1eb4_6a4cf5e80dd54ec1a4a1145325d43067mv2.jpg',
    'assets/images/4ae1eb4_966040046f3d4bc5bdde30af306b039bmv2.jpg',
    'assets/images/5ae1eb4_122ed1d790714daea945ca88fc66576bmv2.jpg',
    'assets/images/6ae1eb4_7824b8212dd24fe1b5a756c8be52e9f2mv2.jpg',
    'assets/images/7ae1eb4_a35abff94d2749a19e3fe27c2c8bb1d6mv2.jpg',
    'assets/images/8ae1eb4_1470385a68c544e4bc959c798a25d835mv2.jpg',
    'assets/images/9ae1eb4_31ab047a2b734582b7246e1d8d0a1af8mv2.jpg',
    'assets/images/10ae1eb4_bf909eac5acd4a45b7e372e762d6355amv2.jpg',
    'assets/images/11ae1eb4_a43e2978459a4133af47fc7f350e99efmv2.jpg',
    'assets/images/12ae1eb4_13cf0abe21c44cdfa4227d268af21005mv2.jpg',
    'assets/images/13ae1eb4_2d9047846a524aa389399cc2e618f402mv22.jpg',
    'assets/images/14ae1eb4_ef1b1fd109b648bb998b1b15ff5fe4c2mv2.jpg',
    'assets/images/15ae1eb4_1e256225b2cc4deaa2ccb5acfc45a103mv2.jpg',
    'assets/images/16ae1eb4_6dc23fa728044537bc6840a34fc59838mv2.jpg',
    'assets/images/17ae1eb4_512ae9b419dc4fbbb1c91d97306625f4mv2.jpg',
    'assets/images/18ae1eb4_ba1e034a860844c29da4b64edc5ba06dmv2.jpg',
    'assets/images/19ae1eb4_394b9ff34f28491badef70394c3d96abmv2.jpg',
  ];

  final List<String> imagePaths2 = [
    'assets/images/20ae1eb4_f1cff4d439d3429a8016e38e4d2b6350mv2.jpg',
    'assets/images/21ae1eb4_4f91b825b27e448fbb36e86598fc1442mv2.jpg',
    'assets/images/22ae1eb4_b34be2ac24cd4d05b765bbe11652fdb3mv2.jpg',
    'assets/images/23ae1eb4_11287fef6dc945b8bbb28d024a933e08mv2.jpg',
    'assets/images/24ae1eb4_5cb7ce4ff49645728b84ffd7a0f4a55amv2.jpg',
    'assets/images/25ae1eb4_d63819979e194608b05398b041d1e0d8mv2.jpg',
    'assets/images/26ae1eb4_1afe45ab466b462d8c13a76809a3dc37mv2.jpg',
    'assets/images/19ae1eb4_394b9ff34f28491badef70394c3d96abmv2.jpg',
    'assets/images/28ae1eb4_38f191e6042544989def81375320f3c5mv2.jpg',
    'assets/images/38ae1eb4_86c181a57b11462a962351c8804d2383mv2.jpg',
    'assets/images/30ae1eb4_0e42e0f594f74498a44b8166614301b4mv2.jpg',
    'assets/images/31ae1eb4_9aa5336178104c43a5d9d13b57431e6cmv2.jpg',
    'assets/images/32ae1eb4_d7c320f33a10472496ae1042de82e627mv2.jpg',
    'assets/images/33ae1eb4_e1913ad5abc344f7a3bf6f5a054fbda9mv2.jpg',
    'assets/images/34ae1eb4_710357f69a9a42f7a99bbd9b75442f3emv2.jpg',
    'assets/images/36ae1eb4_41d9d7b7eb3c4f39a30f391648ead645mv2.jpeg',


  ];

  final ScrollController _controller1 = ScrollController();
  final ScrollController _controller2 = ScrollController();

  @override
  void initState() {
    super.initState();
    _startAutoScroll(_controller1, 2); // Right-to-left
    _startAutoScroll(_controller2, -2); // Left-to-right
  }

  void _startAutoScroll(ScrollController controller, double scrollAmount) {
    Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (controller.hasClients) {
        final maxScrollExtent = controller.position.maxScrollExtent;
        final minScrollExtent = controller.position.minScrollExtent;
        final currentScrollPosition = controller.offset;

        if (scrollAmount > 0 && currentScrollPosition < maxScrollExtent) {
          controller.animateTo(
            currentScrollPosition + scrollAmount,
            duration: const Duration(milliseconds: 16),
            curve: Curves.linear,
          );
        } else if (scrollAmount < 0 && currentScrollPosition > minScrollExtent) {
          controller.animateTo(
            currentScrollPosition + scrollAmount,
            duration: const Duration(milliseconds: 16),
            curve: Curves.linear,
          );
        } else {
          controller.jumpTo(
              scrollAmount > 0 ? minScrollExtent : maxScrollExtent);
        }
      }
    });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  Widget _buildSlider(ScrollController controller, List<String> imagePaths) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: controller,
          child: Row(
            children: List.generate(
              imagePaths.length,
                  (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    imagePaths[index],
                    width: 500,
                    height: 500,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildSlider(_controller1, imagePaths1), // Original slider
          _buildSlider(_controller2, imagePaths2), // New slider (left-to-right)
        ],
      ),
    );
  }
}
