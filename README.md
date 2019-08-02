# gributils scraper for yr.no

This scraper downloads and indexes GRIB files from
[yr.no](https://hjelp.yr.no/hc/en/articles/360009342993-V%C3%A6rdata-i-GRIB-format)
([licensing
terms](https://hjelp.yr.no/hc/en-us/articles/360001946134)).

# Service example for docker stack:

    scraper-yr:
      image: innovationgarage/gributils-scraper-yr
      environment:
        INDEXURL: http://gribindexer:1028
