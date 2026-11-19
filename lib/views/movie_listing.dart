import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

class MovieListing extends StatefulWidget {
  final Movie movie;

  const MovieListing({
    super.key,
    required this.movie,
  });

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketamount = 1;
  String _feedback = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.movie.title,
              style: cinemaHeaderStyle.copyWith(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  widget.movie.runtime,
                  style: const TextStyle(
                    color: cinemaFontMuted,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  widget.movie.ageRating,
                  style: const TextStyle(
                    color: cinemaFontMuted,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.movie.synopsis,
              style: const TextStyle(
                color: cinemaFontWhite,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Screening time: ${widget.movie.screeningTime}',
              style: const TextStyle(
                color: cinemaFontWhite,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Ticket price: ${widget.movie.formattedPrice}',
              style: const TextStyle(
                color: cinemaFontWhite,
              ),
            ),
            const SizedBox(height: 20),
            DropdownMenu<int>(
              initialSelection: _ticketamount,
              onSelected: (int? value) {
                if (value != null) {
                  setState(() {
                    _ticketamount = value;
                  });
                }
              },
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 1, label: "1"),
                DropdownMenuEntry(value: 2, label: "2"),
                DropdownMenuEntry(value: 3, label: "3"),
                DropdownMenuEntry(value: 4, label: "4"),
                DropdownMenuEntry(value: 5, label: "5"),
              ],
            ),
            const SizedBox(height: 12),
            PrimaryButton(
              label: 'Add to order',
              onPressed: () {
                final BasketItem item = BasketItem(
                  movie: widget.movie,
                  quantity: _ticketamount,
                );

                BasketRepository.instance.addItem(item);

                setState(() {
                  _feedback =
                      "$_ticketamount ticket(s) added to order for ${widget.movie.title}";
                });
              },
            ),
            const SizedBox(height: 12),
            Text(
              _feedback,
              style: const TextStyle(
                color: cinemaFontWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
