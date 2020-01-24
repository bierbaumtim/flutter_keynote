import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import "package:flare_flutter/flare_actor.dart";
import "package:flare_flutter/flare_cache_builder.dart";
import 'package:flare_flutter/provider/asset_flare.dart';

class FlareSlide extends StatefulWidget {
  FlareSlide({Key key}) : super(key: key);

  @override
  _FlareSlideState createState() => _FlareSlideState();
}

class _FlareSlideState extends State<FlareSlide> {
  String _animationName = "idle";

  final asset = AssetFlare(bundle: rootBundle, name: "assets/flare/Teddy.flr");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'A flare animation, why not?',
                style: Theme.of(context).textTheme.display2.copyWith(
                  color: Colors.white
                ),
              ),
              Expanded(
                child: FlareCacheBuilder(
                  [asset],
                  builder: (BuildContext context, bool isWarm) {
                    return !isWarm
                        ? Container(child: Text("Loading"))
                        : FlareActor.asset(
                            asset,
                            alignment: Alignment.center,
                            fit: BoxFit.contain,
                            animation: _animationName,
                          );
                  },
                ),
              )
            ],
          ),
        ));
  }
}