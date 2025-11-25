# FULL FLUTTER SECURE ALARM APP (COMPLETE PROJECT)

# ⚫⚪ DARK THEME • SECURE PIN • RINGTONES • MULTI-ALARM • CHALLENGES • TIMER • STOPWATCH

Below is the **entire project code**, rewritten from scratch, including:

✔ Full Flutter code
✔ AndroidManifest.xml
✔ Alarm scheduling
✔ Repeating alarms
✔ Custom ringtone player
✔ Vibration engine
✔ Challenge-based dismiss
✔ PIN keypad
✔ Timer & Stopwatch
✔ Multi-alarm list
✔ Black & White UI

---

# 📁 pubspec.yaml

```yaml
name: secure_alarm_app
publish_to: 'none'
description: Fully featured secure alarm Flutter application.

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  android_alarm_manager_plus: ^3.0.4
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  flutter_local_notifications: ^17.0.0
  audioplayers: ^5.2.0
  sensors_plus: ^4.0.0
  qr_code_scanner: ^1.0.1

flutter:
  uses-material-design: true
  assets:
    - assets/audio/
```

---

# 📁 ANDROID MANIFEST (REQUIRED)

## android/app/src/main/AndroidManifest.xml

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">

    <uses-permission android:name="android.permission.WAKE_LOCK" />
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
    <uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM" />

    <application
        android:label="Secure Alarm"
        android:icon="@mipmap/ic_launcher">

        <activity
            android:name="com.example.secure_alarm_app.MainActivity"
            android:exported="true"
            android:launchMode="singleTask"
            android:showWhenLocked="true"
            android:turnScreenOn="true" />

    </application>
</manifest>
```

---

# 📁 lib/main.dart

```dart
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'theme.dart';
import 'screens/alarm_list.dart';
import 'alarm_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("alarms");
  await AlarmService.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: AlarmListScreen(),
    );
  }
}
```

---

# 📁 lib/theme.dart

```dart
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.white,
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
    ),
  );
}
```

---

# 📁 lib/models/alarm_model.dart

```dart
import 'package:hive/hive.dart';

part 'alarm_model.g.dart';

@HiveType(typeId: 0)
class AlarmModel {
  @HiveField(0)
  String id;

  @HiveField(1)
  int hour;

  @HiveField(2)
  int minute;

  @HiveField(3)
  String pin;

  @HiveField(4)
  String hint;

  @HiveField(5)
  bool repeatDaily;

  AlarmModel({
    required this.id,
    required this.hour,
    required this.minute,
    required this.pin,
    required this.hint,
    this.repeatDaily = false,
  });
}
```

---

# 📁 lib/alarm_service.dart

```dart
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'screens/alarm_trigger.dart';

class AlarmService {
  static Future initialize() async {
    await AndroidAlarmManager.initialize();
  }

  static Future setAlarm(DateTime time, String id) async {
    await AndroidAlarmManager.oneShotAt(
      time,
      int.parse(id),
      alarmCallback,
      exact: true,
      wakeup: true,
    );
  }
}

@pragma('vm:entry-point')
void alarmCallback() {
  runApp(AlarmTriggerScreen());
}
```

---

# 📁 lib/audio/alarm_audio_player.dart

```dart
import 'package:audioplayers/audioplayers.dart';

class AlarmAudioPlayer {
  static final _player = AudioPlayer();

  static Future start() async {
    await _player.setReleaseMode(ReleaseMode.loop);
    await _player.play(AssetSource("audio/alarm.mp3"));
  }

  static Future stop() async {
    await _player.stop();
  }
}
```

---

# 📁 lib/screens/alarm_list.dart

```dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'alarm_home.dart';
import '../models/alarm_model.dart';

class AlarmListScreen extends StatefulWidget {
  @override
  State<AlarmListScreen> createState() => _AlarmListScreenState();
}

class _AlarmListScreenState extends State<AlarmListScreen> {
  @override
  Widget build(BuildContext context) {
    final alarms = Hive.box("alarms");

    return Scaffold(
      appBar: AppBar(title: const Text("Your Alarms")),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => AlarmHomeScreen())),
      ),
      body: ValueListenableBuilder(
        valueListenable: alarms.listenable(),
        builder: (_, box, __) {
          if (box.isEmpty) {
            return const Center(child: Text("No alarms added."));
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (_, i) {
              AlarmModel alarm = box.getAt(i);

              return ListTile(
                title: Text(
                  "${alarm.hour.toString().padLeft(2, '0')}:${alarm.minute.toString().padLeft(2, '0')}",
                  style: const TextStyle(color: Colors.white, fontSize: 28),
                ),
                subtitle: Text(
                  alarm.repeatDaily ? "Repeats daily" : "One-time alarm",
                  style: const TextStyle(color: Colors.white54),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    box.deleteAt(i);
                    setState(() {});
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
```

---

# 📁 lib/screens/alarm_home.dart

```dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/alarm_model.dart';
import '../alarm_service.dart';
import 'dart:math';

class AlarmHomeScreen extends StatefulWidget {
  @override
  State<AlarmHomeScreen> createState() => _AlarmHomeScreenState();
}

class _AlarmHomeScreenState extends State<AlarmHomeScreen> {
  TimeOfDay? time;
  final pin = TextEditingController();
  final hint = TextEditingController();
  bool repeatDaily = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Alarm")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final picked = await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());
                if (picked != null) setState(() => time = picked);
              },
              child: Text(time == null
                  ? "+ Pick Time"
                  : time!.format(context)),
            ),

            TextField(
              controller: pin,
              decoration: const InputDecoration(labelText: "Secret PIN"),
            ),

            TextField(
              controller: hint,
              decoration: const InputDecoration(labelText: "Hint (optional)"),
            ),

            SwitchListTile(
              value: repeatDaily,
              title: const Text("Repeat Daily"),
              onChanged: (v) => setState(() => repeatDaily = v),
            ),

            ElevatedButton(
              onPressed: () {
                if (time == null || pin.text.isEmpty) return;

                final box = Hive.box("alarms");
                final id = Random().nextInt(999999).toString();

                box.add(AlarmModel(
                  id: id,
                  hour: time!.hour,
                  minute: time!.minute,
                  pin: pin.text,
                  hint: hint.text,
                  repeatDaily: repeatDaily,
                ));

                final now = DateTime.now();
                final alarmDate = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  time!.hour,
                  time!.minute,
                );

                AlarmService.setAlarm(alarmDate, id);
                Navigator.pop(context);
              },
              child: const Text("Save Alarm"),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

# 📁 lib/screens/alarm_trigger.dart

```dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../audio/alarm_audio_player.dart';
import 'pin_keypad.dart';

class AlarmTriggerScreen extends StatefulWidget {
  @override
  State<AlarmTriggerScreen> createState() => _AlarmTriggerScreenState();
}

class _AlarmTriggerScreenState extends State<AlarmTriggerScreen> {
  String pin = "";
  String hint = "";

  @override
  void initState
```
