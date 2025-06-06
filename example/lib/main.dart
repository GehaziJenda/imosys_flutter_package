import 'package:flutter/material.dart';
import 'package:imosys_flutter_package/imosys_flutter_package.dart';
import 'package:imosys_flutter_package/widgets/imosys_button.dart';

void main() {
  ImosysConfig.setBaseUrl("");

  runApp(
    ImosysAppWrapper(
      config: ImosysConfig(
        defaultFontSize: 16,
        defaultFontColor: Colors.black,
        primaryColor: Colors.orange,
        defaultHorizontalPadding: 20,
        cursorColor: Colors.blue,
        defaultBorderColor: Colors.black,
        defaultVerticalPadding: 16,
        defaultHorizontalMargin: 20,
        defaultVerticalMargin: 26,
        defaultContainerRadius: 14,
        primaryButtonBackgroundColor: Colors.orange,
        primaryButtonTextColor: Colors.white,
        defaultTextFieldFillColor: Colors.grey,
        defaultTextFieldIsFilled: true,
        defaultTextFieldHasBorder: false,
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = TextEditingController();
  final genderController = TextEditingController();
  bool dontShowText = true;
  @override
  Widget build(BuildContext context) {
    final config = ImosysAppWrapper.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: config.defaultHorizontalPadding,
          vertical: config.defaultVerticalPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     ImosysButton(
            //       text: "Logout",
            //       elevation: 2,
            //       onTap: () {
            //         //perform some action
            //       },
            //     ),
            //   ],
            // ),
            ImosysTextField(
              hint: "",
              controller: controller,
              label: "Full name",
              fillColor: Colors.grey,
            ),
            // SizedBox(
            //   height: config.defaultVerticalMargin,
            // ),
            // ImosysTextField(
            //   hint: "Password",
            //   controller: controller,
            //   hintFontColor: Colors.grey,
            //   inputType: TextInputType.visiblePassword,
            //   dontShowText: dontShowText,
            //   toggleObscure: () {
            //     dontShowText = !dontShowText;
            //     setState(() {});
            //   },
            // ),
            // SizedBox(
            //   height: config.defaultVerticalMargin,
            // ),
            // ImosysTextField(
            //   hint: "Gender",
            //   suffixIcon: const Icon(Icons.arrow_drop_down),
            //   controller: genderController,
            //   hintFontColor: Colors.grey,
            //   onChange: (value) {
            //     if (value != null) {
            //       setState(() {
            //         genderController.text = value;
            //       });
            //     }
            //   },
            //   items: const ["", "Male", "Female"],
            // ),
            // SizedBox(
            //   height: config.defaultVerticalMargin,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     ImosysButton(
            //       text: "Logout",
            //       hasBorder: true,
            //       borderColor: config.primaryColor,
            //       color: Colors.transparent,
            //       textColor: Colors.black,
            //       onTap: () {},
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
