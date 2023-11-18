import 'package:asincronismo/services/mockapi.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Asincronismo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedButton(
                icon: Icons.flash_on_outlined,
                asyncAction: () => MockApi().getFerrariInteger(),
                color: Colors.yellow,
              ),
              const SizedBox(height: 20),
              AnimatedButton(
                icon: Icons.house,
                asyncAction: () => MockApi().getHyundaiInteger(),
                color: const Color.fromARGB(255, 99, 185, 65)           
              ),
              const SizedBox(height: 20),
              AnimatedButton(
                icon: Icons.hail,
                asyncAction: () => MockApi().getFisherPriceInteger(),
                color: const Color.fromARGB(255, 255, 166, 82),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  final IconData icon;
  final Future<int> Function() asyncAction;
  final Color color;

  const AnimatedButton({Key? key, required this.icon, required this.asyncAction, required this.color})
      : super(key: key);

 @override
  // ignore: library_private_types_in_public_api
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool isLoading = false;
  int? result;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_animationController);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            _animationController.forward();
            setState(() {
              isLoading = true;
              result = null;
            });
            final value = await widget.asyncAction();
            setState(() {
              isLoading = false;
              result = value;
            });
            _animationController.reverse();
          },
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: widget.color,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  widget.icon,
                  color: Colors.black,
                  size: 40,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        isLoading
            ? SizedBox(
                height: 10, 
                child: LinearProgressIndicator(
                  value: _animationController.value,
                  backgroundColor: widget.color.withOpacity(0.5),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Container(),
        const SizedBox(height: 8),
        result != null
            ? Text(
                '$result',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: widget.color,
                ),
              )
            : Container(),
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
