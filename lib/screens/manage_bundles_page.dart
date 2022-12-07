import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:truth_or_drink/shared/constants.dart';

class Bundles extends StatelessWidget {
  const Bundles({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("sets").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Text('No data');
        }
        //Text(snapshot.data!.docs[index]['name']);
        return ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 0,
            maxHeight: 320,
          ),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.lightBlue)),
                elevation: 2,
                child: ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.list, color: betterBlack),
                      const SizedBox(width: 20),
                      Icon(Icons.delete, color: betterBlack),
                    ],
                  ),
                  title: Text(
                    snapshot.data!.docs[index]['name'],
                    style: defaultFontStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class ManageBundlesPage extends StatefulWidget {
  const ManageBundlesPage({super.key});

  @override
  State<ManageBundlesPage> createState() => _ManageBundlesPageState();
}

class _ManageBundlesPageState extends State<ManageBundlesPage> {
  @override
  Widget build(BuildContext context) {
    return Base(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const Logo(width: 125.0),
            const SizedBox(height: 74.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: authHorizontalPadding),
              child: Text(
                'Manage bundles',
                style: defaultFontStyle.copyWith(
                  fontSize: 33,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: authHorizontalPadding),
              child: Text(
                'Bundles',
                style: defaultFontStyle.copyWith(
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: authHorizontalPadding - 5),
              child: const Bundles(),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 130),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: Text(
                  'Add bundle',
                  style: defaultFontStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  side: const BorderSide(
                    color: Colors.lightBlue,
                  ),
                ),
              ),
            )

            // Padding(
            //   padding:
            //       EdgeInsets.symmetric(horizontal: authHorizontalPadding - 5),
            //   child: Card(
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10),
            //         side: const BorderSide(color: Colors.lightBlue)),
            //     elevation: 2,
            //     child: ListTile(
            //       trailing: Icon(
            //         Icons.lock,
            //         color: betterBlack,
            //       ),
            //       title: Text(
            //         'Default questions',
            //         style: defaultFontStyle.copyWith(
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding:
            //       EdgeInsets.symmetric(horizontal: authHorizontalPadding - 5),
            //   child: GestureDetector(
            //     onTap: () {
            //       Navigator.pushNamed(context, '/manage-question-set');
            //     },
            //     child: Card(
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10),
            //           side: const BorderSide(color: Colors.lightBlue)),
            //       elevation: 2,
            //       child: ListTile(
            //         trailing: Icon(
            //           Icons.delete,
            //           color: betterBlack,
            //         ),
            //         title: Text(
            //           'Family friendly',
            //           style: defaultFontStyle.copyWith(
            //             fontWeight: FontWeight.w600,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding:
            //       EdgeInsets.symmetric(horizontal: authHorizontalPadding - 5),
            //   child: GestureDetector(
            //     onTap: () {
            //       Navigator.pushNamed(context, '/manage-question-set');
            //     },
            //     child: Card(
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10),
            //           side: const BorderSide(color: Colors.lightBlue)),
            //       elevation: 2,
            //       child: ListTile(
            //         trailing: Icon(
            //           Icons.delete,
            //           color: betterBlack,
            //         ),
            //         title: Text(
            //           'Friends',
            //           style: defaultFontStyle.copyWith(
            //             fontWeight: FontWeight.w600,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
