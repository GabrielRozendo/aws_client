import 'package:aws_cognito_identity_api/cognito-identity-2014-06-30.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_cognito_identity_api'));

  t.test('ensure_compilation', () {
    CognitoIdentity(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
