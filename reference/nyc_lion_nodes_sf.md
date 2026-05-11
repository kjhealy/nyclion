# NYC LION nodes

Point locations of every node (topological junction) in the LION
network. A node occurs wherever two or more LION linear features cross,
regardless of whether a physical intersection occurs there. Joins to
[nyc_lion_sf](https://kjhealy.github.io/nyclion/reference/nyc_lion_sf.md)
via `node_id_from` / `node_id_to`, and to
[nyc_lion_node_streets_df](https://kjhealy.github.io/nyclion/reference/nyc_lion_node_streets_df.md)
via `nodeid`.

## Usage

``` r
nyc_lion_nodes_sf
```

## Format

### `nyc_lion_nodes_sf`

A simple feature collection with 139,421 rows and 3 columns (point
geometry):

- nodeid:

  Unique node identifier.

- v_intersect:

  `"VirtualIntersection"` if the node is flagged as a virtual
  intersection in DOITT's CSCL database; blank otherwise.

- Shape:

  Point geometry in EPSG:2263.

## Source

NYC Department of City Planning, LION
(<https://www.nyc.gov/site/planning/data-maps/open-data.page>).

## Details

EPSG:2263, NAD83 / New York Long Island (ftUS).

Edition 25C, "BYTES of the BIG APPLE", published 2025-08-18 by NYC
Department of City Planning. Update frequency is quarterly.

## Author

Kieran Healy
