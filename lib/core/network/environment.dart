import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Env {
  static final String uriBase =
      'https://${dotenv.get('URI_BASE', fallback: 'exception dotenv: URI_BASE')}/v2';
  static final String uriSprite =
      'https://${dotenv.get('URI_SPRITES', fallback: 'exception dotenv: URI_SPRITES')}';
}
