import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter_clone/pages/login_page.dart';
import 'package:instagram_flutter_clone/providers/user_provider.dart';
import 'package:instagram_flutter_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_flutter_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_flutter_clone/responsive/web_screen_layout.dart';
import 'package:instagram_flutter_clone/utils/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCl0dXWco6IQwfYprYusbdAZYSoCx-Uqxs",
            appId: "1:666783177836:web:ae4c4df7fe78023f5a0c49",
            messagingSenderId: "666783177836",
            projectId: "instagram-clone-331e1",
            storageBucket: "instagram-clone-331e1.appspot.com"
        )
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => UserProvider()
        )
      ],
      child: MaterialApp(
          title: 'Instagram clone',
          theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: mobileBackgroundColor
          ),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges() ,
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.active) {
                if(snapshot.hasData) {
                  return const ResponsiveLayout(
                      webScreenLayout: WebScreenLayout(),
                      mobileScreenLayout: MobileScreenLayout()
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting){
                  return const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  );
                }
              }

              return const LoginPage();
            },
          )
      ),
    );
  }
}