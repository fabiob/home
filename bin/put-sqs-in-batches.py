#!/usr/bin/env python3

import argparse
import boto3
import json
import sys

parser = argparse.ArgumentParser(
    description='Sends messages to SQS in batches.')

parser.add_argument(
    '-q', '--queue-url', dest='queue_url', type=str, required=True,
    help='The name of the AWS SQS queue to save.')

parser.add_argument(
    '-b', '--batch-size', dest='batch_size', type=int, default=10,
    help='The batch size.')

args = parser.parse_args()

client = boto3.client('sqs')


def chunks(it, n):
    acc = []
    for item in it:
        acc.append(item)

        if len(acc) == n:
            yield acc
            acc.clear()

    if len(acc) > 0:
        yield acc


for n, chunk in enumerate(chunks(sys.stdin, args.batch_size), start=1):
    response = client.send_message_batch(
        QueueUrl=args.queue_url,
        Entries=[{'Id': f'chunk-{n}-line-{i}', 'MessageBody': body} for i, body in enumerate(chunk, start=1)])
    for failure in response.get('Failed', []):
        print("[ERROR] " + json.dumps(failure))
