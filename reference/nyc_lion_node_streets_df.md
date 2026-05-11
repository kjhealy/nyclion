# NYC LION node-to-street-name lookup

Lists every street name associated with each LION node. Because most
nodes are the meeting point of two or more segments, a given `node_id`
typically has multiple associated street names (one row per name).

## Usage

``` r
nyc_lion_node_streets_df
```

## Format

### `nyc_lion_node_streets_df`

A tibble with 245,070 rows and 2 columns:

- node_id:

  Node identifier, joins to
  [nyc_lion_nodes_sf](https://kjhealy.github.io/nyclion/reference/nyc_lion_nodes_sf.md)
  `nodeid` and to
  [nyc_lion_sf](https://kjhealy.github.io/nyclion/reference/nyc_lion_sf.md)
  `node_id_from` / `node_id_to`.

- street_name:

  Street name associated with the node.

## Source

NYC Department of City Planning, LION
(<https://www.nyc.gov/site/planning/data-maps/open-data.page>).

## Details

Edition 25C, "BYTES of the BIG APPLE", published 2025-08-18 by NYC
Department of City Planning. Update frequency is quarterly.

## Author

Kieran Healy
