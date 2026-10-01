import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketamount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(appTitle, style: cinemaHeaderStyle),
          backgroundColor: cinemaSurface,
          iconTheme: const IconThemeData(color: cinemaBrand),
          elevation: 0,
        ),
        drawer: const NavDrawer(),
        body: Container(
            child: Column(children: [
          Text("The Bee Movie"),
          Row(
            children: [Text("91 mins"), Text("PG")],
          ),
          Text("The Bee Movie is a movie about a bee"),
          DropdownMenu<int>(
              initialSelection: _ticketamount,
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 1, label: "1"),
                DropdownMenuEntry(value: 2, label: "2"),
                DropdownMenuEntry(value: 3, label: "3"),
                DropdownMenuEntry(value: 4, label: "4"),
                DropdownMenuEntry(value: 5, label: "5")
              ])
        ])));
  }
}
