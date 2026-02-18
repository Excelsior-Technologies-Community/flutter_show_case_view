## 🎯 flutter_show_case_view

flutter_show_case_view is a reusable Flutter onboarding / coach-mark library that highlights widgets and guides users step-by-step through your application.

It helps you easily create feature discovery UI, app tutorials, and first-time user guidance without writing complex overlay logic.

You can highlight any widget like a profile icon, FAB button, menu, or text field and show helpful tips to the user.

-----------------------

## ✨ Feature Preview

- 🔦 Highlight any widget
- 🌑 Dark overlay background
- ⭕ Circle highlight
- ⬛ Rectangle highlight
- 🧭 Step-by-step navigation
- ⏭ Next & ⏮ Back buttons
- ❌ Skip tutorial
- 🔢 Step indicator (1/3)
- 📍 Tooltip with title & description
- 🧠 Uses OverlayEntry (works above entire UI)
- 🔁 Reusable in any screen

----------------------------

## 📦 Installation

Add dependency in your pubspec.yaml
```
dependencies:
  flutter_show_case_view:
    path: https://github.com/Excelsior-Technologies-Community/flutter_show_case_view/tree/stage
```
Then run:
```
flutter pub get
```

-------------------------------

## Preview

https://github.com/user-attachments/assets/8a835c08-fe6b-4859-96ff-04fba0f40038

------------------------------
## 🗂 File Structure
```
flutter_show_case_view/
│
├─ lib/
│   ├─ flutter_show_case_view.dart
│   │   // Main export file (what users import in their app)
│   │
│   ├─src/
│   │     ├─ controller/
│   │     │    └─ showcase_controller.dart
│   │     │        // Handles tutorial flow: start, next, back, skip, finish
│   │     │
│   │     ├─ model/
│   │     │    └─ showcase_step.dart
│   │     │        // Data model representing a single showcase step
│   │     │
│   │     ├─ overlay/
│   │     │    └─ showcase_overlay.dart
│   │     │        // Overlay UI displayed above the app with tooltip & buttons
│   │     │
│   │     ├─ painter/
│   │     │    └─ highlight_painter.dart
│   │     │        // CustomPainter that draws dark background and highlight hole
│   │     │
│   │     └─ widget/
│   │          └─ showcase_target.dart
│   │             // Wrap any widget you want to highlight
│   │  
│   │    
│   └─ main.dart
│      // Complete demo showing how to use the package
│
│      
│           
│
├─ README.md
│   // Package documentation
│
├─ LICENSE
│   // MIT License
│
└─ pubspec.yaml
    // Package metadata and dependencies

```

------------------------------

## 🚀 How To Use

1️⃣ Import package
```
import 'package:flutter_show_case_view/flutter_show_case_view.dart';
```
2️⃣ Create keys & controller
```
final ShowcaseController controller = ShowcaseController();

final GlobalKey profileKey = GlobalKey();
final GlobalKey fabKey = GlobalKey();
```
3️⃣ Wrap widgets
```
ShowcaseTarget(
  showcaseKey: profileKey,
  child: Icon(Icons.person),
);

ShowcaseTarget(
  showcaseKey: fabKey,
  child: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
);
```
4️⃣ Start tutorial
```
Call inside initState:

@override
void initState() {
  super.initState();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    controller.start(context, [

      ShowcaseStep(
        targetKey: profileKey,
        title: "Profile",
        description: "Open your profile from here",
      ),

      ShowcaseStep(
        targetKey: fabKey,
        title: "Create",
        description: "Tap to create new content",
        shape: ShowcaseShape.circle,
      ),

    ]);
  });
}
```

--------------------------------

## 🧾 ShowcaseStep Properties

| Property    | Type          | Description         |
| ----------- | ------------- | ------------------- |
| targetKey   | GlobalKey     | Widget to highlight |
| title       | String        | Title text          |
| description | String        | Description text    |
| shape       | ShowcaseShape | circle or rectangle |


-------------------------------

## 📄 MIT LICENSE
```
MIT License

Copyright (c) 2026 

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```


















