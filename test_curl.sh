curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" \
     -d '{"Records": [{"s3": {"bucket": {"name": "eg-data-for-str"},"object": {"key": "v2/2025/06/01/01/part-00000-3691a18d-0ad2-4c46-bae9-cbe179bf9f3d-c000.snappy.parquet"}}}]}' \
	-H "Content-Type: application/json"
echo ""
