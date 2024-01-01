import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});


  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x=0;
  int y=0;
  num z=0;

  final displayOneController=TextEditingController();
  final displayTwoController=TextEditingController();
  late final AppLifecycleListener _listener;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displayOneController.text=x.toString();
    displayTwoController.text=y.toString();

    _listener =AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onResume: _onResume,
      onDetach: _onDetach,
      onInactive: _onInactive,
      onPause: _onPause,
      onRestart: _onRestart,
      onStateChange: _onStateChange,

    );
  }
  // ignore: avoid_print
  void _onShow() => print("On show called");
  void _onHide() => print("On hide called");
  void _onResume() => print("On Resume called");
  void _onDetach() => print("On Detach called");
  void _onInactive() => print("On Inactive called");
  void _onRestart() => print("On Restart called");
  void _onPause() => print("On Pause called");
  void _onStateChange(AppLifecycleState state){
    print("onStatae change called with state:$state");
  }


  @override
  void dispose()
  {
    displayOneController.dispose();
    displayTwoController.dispose();
    _listener.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          //calculator exp
           CalculatorDisplay(key: const Key("displayOne"),hint:"Enter 1 St Number",controller:displayOneController),
           const SizedBox(height: 30,),
           CalculatorDisplay(key: const Key("displayTwo"),hint:"Enter 2nd Number",controller:displayTwoController),
           Text(
             key: const Key("Result"),
             z.toString(),
          style: const TextStyle(
            fontSize: 40,
            fontWeight:FontWeight.bold,
          ),),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              FloatingActionButton(
                  onPressed:(){
                    setState(() {
                      z= num.tryParse(displayOneController.text)!
                          + num.tryParse(displayTwoController.text)!;
                    });

                  },
                   child: const Icon(CupertinoIcons.add),

              ),
              FloatingActionButton(
                onPressed:(){
                  setState(() {
                    z= num.tryParse(displayOneController.text)!
                        - num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.minus),

              ),
              FloatingActionButton(
                onPressed:(){
                  setState(() {
                    z= num.tryParse(displayOneController.text)!
                        * num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.multiply),

              ),
              FloatingActionButton(
                onPressed:(){
                  setState(() {
                    z= num.tryParse(displayOneController.text)!
                        / num.tryParse(displayTwoController.text)!;
                  });
                },
               child: const Icon(CupertinoIcons.divide),

              )
            ],
          ),
          const SizedBox(
            height: 10
          ),
          FloatingActionButton.extended(
            onPressed:(){
              setState(()
              {
                x=0;
                y=0;
                z=0;
                displayOneController.clear();
                displayTwoController.clear();
              });
              },
            label: const Text("clear"),

          )
          //expand
          //calculator button
        ],
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({
    super.key,
    this.hint ="enter a number",
     required this.controller,
  });
 final String ? hint;
 final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
              width: 3.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
              width: 3.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.white,
          )),
    );
  }
}
