import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/repositories/cart_repository.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

class BasketView extends StatefulWidget {
  const BasketView({super.key});

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> {
  String _confirmationMessage = '';

  @override
  Widget build(BuildContext context) {
    final CartRepository cart = CartRepository.instance;
    final List<CartItem> items = cart.getItems();

    final Widget content;

    if (items.isEmpty) {
      content = Center(
        child: Text(
          _confirmationMessage.isNotEmpty
              ? _confirmationMessage
              : 'Your basket is empty',
          style: const TextStyle(color: cinemaFontWhite),
        ),
      );
    } else {
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'MY ORDER',
            style: TextStyle(
              color: cinemaFontWhite,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          const Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Item',
                  style: TextStyle(
                    color: cinemaFontWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  'Details',
                  style: TextStyle(
                    color: cinemaFontWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'Price',
                  style: TextStyle(
                    color: cinemaFontWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          for (int index = 0; index < items.length; index++)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      '${items[index].quantity} Tickets',
                      style: const TextStyle(
                        color: cinemaBrand,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      '${items[index].quantity} Standard\n'
                      '${items[index].movie.title.toUpperCase()}, '
                      '${items[index].movie.screeningTime}, '
                      'Southsea Cinema Room',
                      style: const TextStyle(
                        color: cinemaFontWhite,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '£${items[index].lineTotal.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: cinemaFontWhite,
                      ),
                    ),
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: cinemaBrand,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    icon: const Icon(
                      Icons.delete_outline,
                      color: cinemaFontWhite,
                    ),
                    onPressed: () {
                      setState(() {
                        cart.removeItem(index);
                      });
                    },
                  ),
                ],
              ),
            ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Service Charge',
                style: TextStyle(color: cinemaFontWhite),
              ),
              Text(
                '£${cart.getServiceCharge().toStringAsFixed(2)}',
                style: const TextStyle(color: cinemaFontWhite),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Due',
                style: TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '£${cart.getTotalDue().toStringAsFixed(2)}',
                style: const TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PrimaryButton(
                label: 'UPDATE ORDER',
                onPressed: () {
                  setState(() {});
                },
              ),
              PrimaryButton(
                label: 'BUY TICKETS',
                onPressed: () {
                  setState(() {
                    cart.clear();
                    _confirmationMessage = 'Order placed successfully';
                  });
                },
              ),
            ],
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: cinemaBackground,
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      drawer: const NavDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: content,
      ),
    );
  }
}
