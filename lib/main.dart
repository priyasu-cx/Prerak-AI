import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prerak_ai/routes/route.dart';
import 'package:prerak_ai/utils/size_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: PrerakAI()));
}

class PrerakAI extends StatelessWidget {
  const PrerakAI({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        return OrientationBuilder(
          builder: (BuildContext context, Orientation orientation){
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              title: "Prerak AI",
              debugShowCheckedModeBanner: false,
              onGenerateRoute: PrerakAIRoute.generateRoute,
              theme: ThemeData(
                  textTheme: GoogleFonts.poppinsTextTheme(),
                  appBarTheme: const AppBarTheme(
                      elevation: 0
                  )
              ),
              // home: const HomeScreen(),
            );
          },
        );
      },
    );
  }
}

