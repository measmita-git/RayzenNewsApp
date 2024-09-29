import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowCase extends StatelessWidget {
  final String text;
  final String skip;
  final String next;
  final void Function()? onSkip;
  final void Function()? onNext;
  const ShowCase(
      {super.key,
        required this.text,
        this.skip = "Skip",
        this.next = "Next",
        this.onNext,
        this.onSkip});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 5, // Spread radius
            blurRadius: 7, // Blur radius
            offset: Offset(0, 3), // Offset of the shadow
          ),
        ],
        color: Theme.of(context).brightness == Brightness.dark
            ? Color(0xff222222)
            : Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: GoogleFonts.redRose(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Color(0xffD9D9D9)
                  : Color(0xff000000),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: onSkip,
                  child: Text(
                    skip,
                    style: GoogleFonts.redRose(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Color(0xffD9D9D9)
                          : Color(0xff000000),
                    ),
                  )),
              const SizedBox(width: 16),
              ElevatedButton(
                  onPressed: onNext,
                  child: Text(
                    next,
                    style: GoogleFonts.redRose(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Color(0xffD9D9D9)
                          : Color(0xff000000),
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
