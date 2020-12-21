// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:shared_aws_api/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'blob_members.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('Blob members 0', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{"BlobMember": "aGkh", "StructMember": {"foo": "dGhlcmUh"}}''',
          200,
          headers: {});
    });

    final service = BlobMembers(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    final output = await service.operationName0();
    expect(output.blobMember, utf8.encode('hi!'));
    expect(output.structMember.foo, utf8.encode('there!'));
/*
{
  "BlobMember": "hi!",
  "StructMember": {
    "foo": "there!"
  }
}
*/
  });
}
