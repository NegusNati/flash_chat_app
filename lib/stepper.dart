import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  StepperDemo({Key? key}) : super(key: key);

  @override
  State<StepperDemo> createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int currentStep = 0;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final address = TextEditingController();
  final postcode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper'),
        centerTitle: true,
      ),
      body: Stepper(
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: currentStep,
        onStepTapped: (step) => setState(() => currentStep = step ), 
        onStepContinue: () {
          final islaststep = currentStep == getSteps().length - 1;

          if (islaststep) {
           
            print(" completed");
          } else {
            setState(
              () {
                currentStep += 1;
              },
            );
          }
        },
        onStepCancel: () {
          final firststate = currentStep == 0;
          if (firststate) {
            return null;
          } else {
            setState(
              () {
                currentStep -= 1;
              },
            );
          }
        },
        controlsBuilder:(BuildContext context, ControlsDetails controls) {
          return Container(
            margin: const EdgeInsets.only(top: 50.0),
            child: Row(
              children: [
                Expanded(child: ElevatedButton(onPressed: controls.onStepContinue,child:const Text("Next"),),),
                const SizedBox(width: 12.0),
                Expanded(child: ElevatedButton(child:Text("Back"), onPressed: controls.onStepCancel,),),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text('Account'),
          content: Column(
            children: [
              TextFormField(
                controller: firstName,
                decoration: InputDecoration(labelText: 'First-Name'),
              ),
              TextFormField(
                controller: lastName,
                decoration: InputDecoration(labelText: 'Last-Name'),
              ),
            ],
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text('Address'),
          content: Column(
            children: [
              TextFormField(
                controller: address,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              TextFormField(
                controller: postcode,
                decoration: InputDecoration(labelText: 'Post Code'),
              ),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 2,
          title: const Text('Complete'),
          content: Container(),
        ),
      ];
}
