import 'package:flutter/material.dart';
import 'package:flutter_show_case_view/flutter_show_case_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ShowcaseController controller = ShowcaseController();

  final GlobalKey profileKey = GlobalKey();
  final GlobalKey searchKey = GlobalKey();
  final GlobalKey fabKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.start(context, [

        ShowcaseStep(
          targetKey: profileKey,
          title: "Profile",
          description: "Open your user profile from here",
          shape: ShowcaseShape.circle,
        ),

        ShowcaseStep(
          targetKey: searchKey,
          title: "Search",
          description: "Search anything in the app",
          shape: ShowcaseShape.rectangle,
        ),

        ShowcaseStep(
          targetKey: fabKey,
          title: "Add Button",
          description: "Create new content using this button",
          shape: ShowcaseShape.circle,
        ),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Showcase Demo",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        actions: [
          ShowcaseTarget(
            showcaseKey: profileKey,
            child: IconButton(
              icon: const Icon(Icons.person,color: Colors.white,),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Center(
        child: ShowcaseTarget(
          showcaseKey: searchKey,
          child: const Text(
            "Home Screen",
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
      floatingActionButton: ShowcaseTarget(
        showcaseKey: fabKey,
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
