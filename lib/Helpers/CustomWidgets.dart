import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

import '../Model/Role.dart';

class CustomWidgets {
  static AppBar CustomAppBar(@required String title) {
    return AppBar(
        title: Text(
          title.toString(),
          style: GoogleFonts.comicNeue(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              icon: Image.asset('resources/phoenix.png'), onPressed: () => {}),
        ]);
  }

  static Widget UserTile(String key, String value) {
    return ListTile(
      title: Row(
        children: [Text(key + " : "), Text(value)],
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  static Widget UserGroupAndRoles() {
   List<Role> roles =  getUserGroupandRoles();

    return Row(
      children: [
        // ListTile(title: getListofRoles(roles),)
      ],
    );
  }

  static List<Text> getListofRoles(List<Role> roles)
  {

    List<Text> roleWid = [];
    for(Role role in roles)
    {
        Text ti = new Text(role.name.toString());
        roleWid.add(ti);
      }
    return roleWid;
  }

  static List<Role> getUserGroupandRoles() {

    List<Role> res = [] ;
    res.add(new Role("afas","oekroekr"));

    res.add(new Role("afas","oekroekr"));

    res.add(new Role("afas","oekroekr"));
    return res;
  }
}
