import 'package:aws_sms_api/sms-2016-10-24.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_sms_api'));

  t.test('ensure_compilation', () {
    SMS(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
