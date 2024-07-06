import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_test/core/constants/constants.dart';

 getApplicationTheme(String themeName){
  switch(themeName){
    case Constants.lightTheme:
      return ligthTheme();
    case Constants.darkTheme:
    return darkTheme();
    default: ligthTheme();
  }
}

ThemeData ligthTheme(){
  return ThemeData(
    fontFamily: Constants.appFontFamily,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark
      )
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.orange),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.orange),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),

    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        )
      ),
    )
  );
}
ThemeData darkTheme(){
  return ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black87
    )
  );
}