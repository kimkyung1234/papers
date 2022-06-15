import 'package:flutter/material.dart';
import 'package:papers/pages/pages.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SearchProvider>(context);

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.go,
                  onSubmitted: (value) async {
                    provider.setText(value);

                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            NavigationPage(),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                    hintText: 'Search',
                  ),
                ),
              ),
            ),
          ),
          provider.getInputText == null
              ? const SizedBox()
              : Expanded(
                  child: SearchListWidget(inputText: provider.getInputText!),
                ),
        ],
      ),
    );
  }
}
