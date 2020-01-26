import 'package:page_transition/page_transition.dart';

enum KeynoteTransition {
  fade,

  leftToRight,

  rightToLeft,

  upToDown,

  downToUp,

  scale,

  size,

  rotate,

  rightToLeftWithFade,

  leftToRightWithFade,
}

PageTransitionType getTransitionType(KeynoteTransition transition) {
  switch(transition) {
    case KeynoteTransition.fade: {
      return PageTransitionType.fade;
    }
    break;

    case KeynoteTransition.leftToRight: {
      return PageTransitionType.leftToRight;
    }
    break;

    case KeynoteTransition.rightToLeft: {
      return PageTransitionType.rightToLeft;
    }
    break;

    case KeynoteTransition.upToDown: {
      return PageTransitionType.upToDown;
    }
    break;

    case KeynoteTransition.downToUp: {
      return PageTransitionType.downToUp;
    }
    break;

    case KeynoteTransition.scale: {
      return PageTransitionType.scale;
    }
    break;

    case KeynoteTransition.size: {
      return PageTransitionType.size;
    }
    break;

    case KeynoteTransition.rotate: {
      return PageTransitionType.rotate;
    }
    break;

    case KeynoteTransition.rightToLeftWithFade: {
      return PageTransitionType.rightToLeftWithFade;
    }
    break;

    case KeynoteTransition.leftToRightWithFade: {
      return PageTransitionType.leftToRightWithFade;
    }
    break;

    default: {
      return PageTransitionType.fade;
    }
  }
}