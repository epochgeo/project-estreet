import sys
import polars as pl
import logging as logging

logging.basicConfig(stream=sys.stdout, logging=logging.info)
LOGGER = logging.getLogger()

def handler(event, context):
    # Pulled from Luke's bb test
    print("**********************")
    print(event, context)
    LOGGER.info(event, context)
    bucket_name = event['Records'][0]['s3']['bucket']['name']
    object_key = event['Records'][0]['s3']['object']['key']

    # Endpoint for the file this lambda will process
    url = f"s3://{bucket_name}/{object_key}"
    try:
        # Showing the endpoint we want to hit
        LOGGER.info(f"Atempting to read file frome {url}")

        # Create a polars lazy_df, this doesn't load anything into memory till collect() is called
        lz_df = pl.scan_parquet(url) 

        # Here we are just returning the size of the file in a json format
        res = {'df_row_count': lz_df.select(pl.len()).collect().item()}
        LOGGER.info(res)
        return res

    except Exception as err:
        LOGGER.error(f'Failed to read {url} due to {err}')
        return err


