# NYC LION street segments

Single-line representation of New York City streets, with address ranges
and a rich set of administrative, traffic, and geocoding attributes.
Also includes non-street linear features such as shoreline, railroads,
district boundaries, paper / private streets, alleys, walking paths, and
ferry routes. See `feature_typ` for the feature classification.

## Usage

``` r
nyc_lion_sf
```

## Format

### `nyc_lion_sf`

A simple feature collection with 242,121 rows and 93 columns (linestring
/ multilinestring geometry):

- street:

  Street or non-street feature name used for labeling.

- saf_street_name:

  Special Address Form street name. Populated when `spec_addr` is
  non-blank.

- feature_typ:

  Feature Type Code. One of: `0` street (vehicle or other), `1`
  railroad, `2` water edge / shoreline, `3` census block boundary, `5`
  paper street, `6` private street, `7` district boundary, `8` physical
  non-street boundary, `9` paper street + census/district boundary, `A`
  alley, `W` non-vehicular addressable path, `C` CCO (Corporation
  Counsel Opinion), `F` ferry route.

- segment_typ:

  Segment Type. Defines status in relation to horizontal-topology
  enhancements. Values: `B` both generic and roadbed, `C` connector
  between adjacent roadbeds, `E` ramp, `F` faux segment, `G` generic,
  `R` roadbed, `T` terminator, `U` undivided, `S` suppressed.

- inc_ex_flag:

  Inclusion / exclusion flag used by NYPD's ETL to mark pedestrian
  walkways / greenways for exclusion.

- rb_layer:

  Roadbed-layer flag. `R` roadbed only, `G` generic only, `B` both, `N`
  neither.

- non_ped:

  Non-pedestrian indicator. `V` vehicle-only, `D` pedestrian-accessible
  but excluded by DOE walking-route logic.

- traf_dir:

  Traffic Direction. `W` with segment direction (one-way), `A` against
  segment direction (one-way), `T` two-way, `P` pedestrian path, blank
  for non-street features.

- traf_src:

  Source of the `traf_dir` value: `DCP` or `DOT`.

- spec_addr:

  Special Address Type Code (e.g., alternative address ranges, duplicate
  addresses, complex names, vanity addresses). Blank for standard
  segments.

- face_code:

  Four-digit face code. A component of the LIONkey identifier (`Boro` +
  `face_code` + `seq_num`).

- seq_num:

  Five-digit sequence number within the face code.

- street_code:

  Six-digit street code: leading borough digit + five-digit street code.

- saf_street_code:

  Special Address Form street code, when `spec_addr` is non-blank.

- lgc1, lgc2, lgc3, lgc4, lgc5, lgc6, lgc7, lgc8, lgc9:

  Local Group Codes. Qualifiers for the five-digit street code; each LGC
  groups street names valid for the segment.

- boe_lgc:

  Board of Elections LGC pointer (1–4) indicating which `lgc` field
  corresponds to the BOE-applicable name.

- segment_id:

  Seven-digit, zero-padded identifier of each physical street segment.
  Stable across the LION key when a segment spans a borough boundary.

- seg_count:

  Segment count.

- loc_status:

  Local-status flag.

- l_zip, r_zip:

  ZIP code on the left / right side of the segment.

- l_boro, r_boro:

  Borough code (1=Manhattan, 2=Bronx, 3=Brooklyn, 4=Queens, 5=Staten
  Island) for the left / right side.

- l_cd, r_cd:

  Community District. Three bytes: borough digit plus the two-digit
  district number, or a JIA code for joint interest areas (parks,
  airports).

- latomicpolygon, ratomicpolygon:

  DCP atomic polygon ID for left / right side.

- lct2020, lct2020suf:

  2020 census tract and suffix, left side.

- rct2020, rct2020suf:

  2020 census tract and suffix, right side.

- lcb2020, lcb2020suf:

  2020 census block and suffix, left side.

- rcb2020, rcb2020suf:

  2020 census block and suffix, right side.

- l_assm_dist, r_assm_dist:

  NYS assembly district, left / right side.

- l_elect_dist, r_elect_dist:

  Election district, left / right side.

- split_elect:

  Split-election-district flag.

- l_schl_dist, r_schl_dist:

  School district, left / right side.

- split_schl:

  Split-school-district flag.

- l_sub_sect, r_sub_sect:

  Sub-section identifier, left / right side.

- san_dist_ind:

  Sanitation-district indicator.

- map_from, map_to:

  Boundary-mapping flags at the `From` and `To` ends of the segment.

- boro_bndry:

  Borough-boundary flag for segments lying along a borough boundary.

- mh_ri_flag:

  Manhattan / Roosevelt-Island flag.

- curve_flag:

  Curve flag.

- radius:

  Curve radius in feet (0 for non-curved segments).

- node_id_from, node_id_to:

  Node IDs at the start and end of the segment (joins to
  [nyc_lion_nodes_sf](https://kjhealy.github.io/nyclion/reference/nyc_lion_nodes_sf.md)).

- node_level_f, node_level_t:

  Node-level codes at the `From` and `To` ends.

- con_parity:

  Connection-parity flag.

- twisted:

  Twisted-segment flag for segments where left / right are swapped
  relative to digitization direction.

- rw_type:

  Right-of-way type code.

- physical_id:

  Physical-segment ID.

- generic_id:

  Generic-segment ID.

- nypdid:

  NYPD segment identifier, where applicable.

- fdnyid:

  FDNY segment identifier, where applicable.

- l_block_face_id, r_block_face_id:

  Block-face IDs for the left / right side of the segment.

- legacy_id:

  Legacy segment identifier.

- status:

  Segment status code.

- street_width_min, street_width_max:

  Minimum and maximum curb-to-curb street width in feet.

- bike_lane:

  Bike-lane class code.

- bike_trafdir:

  Bike-traffic direction code.

- posted_speed:

  Posted speed limit in miles per hour.

- snow_priority:

  Snow-removal priority class.

- number_travel_lanes:

  Number of travel lanes.

- number_park_lanes:

  Number of parking lanes.

- number_total_lanes:

  Total number of lanes (travel + parking).

- from_left, to_left:

  Address range on the left side of the segment (low / high house
  numbers).

- from_right, to_right:

  Address range on the right side of the segment.

- join_id:

  Identifier used to join LION segments to
  [nyc_lion_altnames_df](https://kjhealy.github.io/nyclion/reference/nyc_lion_altnames_df.md)
  during geocoding. Concatenates `Boro` / `face_code` / `lgc1..lgc4`,
  or, for Special Address records, `Boro` / `street_code` / `lgc1..lgc4`
  / `spec_addr`.

- l_pd_service_area, r_pd_service_area:

  NYPD service-area codes for left / right side.

- truck_route_type:

  Truck-route classification code.

- SHAPE:

  Linestring / multilinestring geometry in EPSG:2263.

## Source

NYC Department of City Planning, LION
(<https://www.nyc.gov/site/planning/data-maps/open-data.page>).

## Details

Some columns are "side-specific", carrying separate values for the left
and right sides of the segment along its directional `From` node to `To`
node (e.g., `l_boro` / `r_boro`, `l_zip` / `r_zip`, `l_ct2020` /
`r_ct2020`). All `LION` codes preserve their original string formatting
(zero-padded where applicable).

Source CRS is EPSG:2263, NAD83 / New York Long Island (ftUS).

Roughly 25 columns have been dropped from the source: pre-2020 census
fields, geometry-redundant coordinates, duplicate hyphenated address
ranges, and a handful of always-empty fields. See the upstream metadata
for the full LION schema.

Edition 25C, "BYTES of the BIG APPLE", published 2025-08-18 by NYC
Department of City Planning. Update frequency is quarterly. LION is
spatially aligned with NYCMap aerial photography.

For background on `street_code`, the LGC system, `join_id` construction,
Joint Interest Areas (community-district codes for major parks and
airports), and the conventions for handling alternate / vanity /
duplicate street names, see the upstream `ReadMe.txt` and the LION
metadata PDF bundled with the source data.

## Author

Kieran Healy
