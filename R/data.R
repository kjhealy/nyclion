#' NYC LION alternate street names
#'
#' Alternate and alias names for NYC streets, including valid synonyms
#' (e.g. "Avenue of the Americas" for "6 Avenue") and common
#' misspellings. Designed to support geocoding against [nyc_lion_sf]
#' via the `join_id` key.
#'
#' Street names are disaggregated into pre-directional, pre-type, root
#' name, suffix-type, and suffix-directional components, plus a
#' concatenated form.
#'
#' @format ## `nyc_lion_altnames_df`
#' A tibble with 126,954 rows and 7 columns:
#' \describe{
#'   \item{p_dir}{Pre-directional component (e.g., `"E"`, `"W"`).}
#'   \item{p_type}{Pre-type component (e.g., `"AVE"` in `"Avenue
#'     of..."`).}
#'   \item{s_name}{Root street name component.}
#'   \item{s_type}{Suffix type component (e.g., `"ST"`, `"AVE"`).}
#'   \item{s_dir}{Suffix directional component.}
#'   \item{street}{Concatenated full street name.}
#'   \item{join_id}{Geocoding join key to [nyc_lion_sf].}
#' }
#' @details
#' Edition 25C, "BYTES of the BIG APPLE", published 2025-08-18 by NYC
#' Department of City Planning. Update frequency is quarterly.
#'
#' @author Kieran Healy
#' @source NYC Department of City Planning, LION
#'   (\url{https://www.nyc.gov/site/planning/data-maps/open-data.page}).
"nyc_lion_altnames_df"

#' NYC LION node-to-street-name lookup
#'
#' Lists every street name associated with each LION node. Because most
#' nodes are the meeting point of two or more segments, a given
#' `node_id` typically has multiple associated street names (one row
#' per name).
#'
#' @format ## `nyc_lion_node_streets_df`
#' A tibble with 245,070 rows and 2 columns:
#' \describe{
#'   \item{node_id}{Node identifier, joins to [nyc_lion_nodes_sf]
#'     `nodeid` and to [nyc_lion_sf] `node_id_from` / `node_id_to`.}
#'   \item{street_name}{Street name associated with the node.}
#' }
#' @details
#' Edition 25C, "BYTES of the BIG APPLE", published 2025-08-18 by NYC
#' Department of City Planning. Update frequency is quarterly.
#'
#' @author Kieran Healy
#' @source NYC Department of City Planning, LION
#'   (\url{https://www.nyc.gov/site/planning/data-maps/open-data.page}).
"nyc_lion_node_streets_df"

#' NYC LION nodes
#'
#' Point locations of every node (topological junction) in the LION
#' network. A node occurs wherever two or more LION linear features
#' cross, regardless of whether a physical intersection occurs there.
#' Joins to [nyc_lion_sf] via `node_id_from` / `node_id_to`, and to
#' [nyc_lion_node_streets_df] via `nodeid`.
#'
#' EPSG:2263, NAD83 / New York Long Island (ftUS).
#'
#' @format ## `nyc_lion_nodes_sf`
#' A simple feature collection with 139,421 rows and 3 columns (point
#' geometry):
#' \describe{
#'   \item{nodeid}{Unique node identifier.}
#'   \item{v_intersect}{`"VirtualIntersection"` if the node is flagged
#'     as a virtual intersection in DOITT's CSCL database; blank
#'     otherwise.}
#'   \item{Shape}{Point geometry in EPSG:2263.}
#' }
#' @details
#' Edition 25C, "BYTES of the BIG APPLE", published 2025-08-18 by NYC
#' Department of City Planning. Update frequency is quarterly.
#'
#' @author Kieran Healy
#' @source NYC Department of City Planning, LION
#'   (\url{https://www.nyc.gov/site/planning/data-maps/open-data.page}).
"nyc_lion_nodes_sf"

#' NYC LION street segments
#'
#' Single-line representation of New York City streets, with address
#' ranges and a rich set of administrative, traffic, and geocoding
#' attributes. Also includes non-street linear features such as
#' shoreline, railroads, district boundaries, paper / private streets,
#' alleys, walking paths, and ferry routes. See `feature_typ` for the
#' feature classification.
#'
#' Some columns are "side-specific", carrying separate values for the
#' left and right sides of the segment along its directional `From`
#' node to `To` node (e.g., `l_boro` / `r_boro`, `l_zip` / `r_zip`,
#' `l_ct2020` / `r_ct2020`). All `LION` codes preserve their original
#' string formatting (zero-padded where applicable).
#'
#' Source CRS is EPSG:2263, NAD83 / New York Long Island (ftUS).
#'
#' Roughly 25 columns have been dropped from the source: pre-2020
#' census fields, geometry-redundant coordinates, duplicate hyphenated
#' address ranges, and a handful of always-empty fields. See the
#' upstream metadata for the full LION schema.
#'
#' @format ## `nyc_lion_sf`
#' A simple feature collection with 242,121 rows and 93 columns
#' (linestring / multilinestring geometry):
#' \describe{
#'   \item{street}{Street or non-street feature name used for labeling.}
#'   \item{saf_street_name}{Special Address Form street name. Populated
#'     when `spec_addr` is non-blank.}
#'   \item{feature_typ}{Feature Type Code. One of: `0` street (vehicle
#'     or other), `1` railroad, `2` water edge / shoreline, `3` census
#'     block boundary, `5` paper street, `6` private street, `7`
#'     district boundary, `8` physical non-street boundary, `9` paper
#'     street + census/district boundary, `A` alley, `W` non-vehicular
#'     addressable path, `C` CCO (Corporation Counsel Opinion), `F`
#'     ferry route.}
#'   \item{segment_typ}{Segment Type. Defines status in relation to
#'     horizontal-topology enhancements. Values: `B` both generic and
#'     roadbed, `C` connector between adjacent roadbeds, `E` ramp, `F`
#'     faux segment, `G` generic, `R` roadbed, `T` terminator, `U`
#'     undivided, `S` suppressed.}
#'   \item{inc_ex_flag}{Inclusion / exclusion flag used by NYPD's ETL
#'     to mark pedestrian walkways / greenways for exclusion.}
#'   \item{rb_layer}{Roadbed-layer flag. `R` roadbed only, `G` generic
#'     only, `B` both, `N` neither.}
#'   \item{non_ped}{Non-pedestrian indicator. `V` vehicle-only, `D`
#'     pedestrian-accessible but excluded by DOE walking-route logic.}
#'   \item{traf_dir}{Traffic Direction. `W` with segment direction
#'     (one-way), `A` against segment direction (one-way), `T` two-way,
#'     `P` pedestrian path, blank for non-street features.}
#'   \item{traf_src}{Source of the `traf_dir` value: `DCP` or `DOT`.}
#'   \item{spec_addr}{Special Address Type Code (e.g., alternative
#'     address ranges, duplicate addresses, complex names, vanity
#'     addresses). Blank for standard segments.}
#'   \item{face_code}{Four-digit face code. A component of the LIONkey
#'     identifier (`Boro` + `face_code` + `seq_num`).}
#'   \item{seq_num}{Five-digit sequence number within the face code.}
#'   \item{street_code}{Six-digit street code: leading borough digit +
#'     five-digit street code.}
#'   \item{saf_street_code}{Special Address Form street code, when
#'     `spec_addr` is non-blank.}
#'   \item{lgc1, lgc2, lgc3, lgc4, lgc5, lgc6, lgc7, lgc8, lgc9}{Local
#'     Group Codes. Qualifiers for the five-digit street code; each LGC
#'     groups street names valid for the segment.}
#'   \item{boe_lgc}{Board of Elections LGC pointer (1--4) indicating
#'     which `lgc` field corresponds to the BOE-applicable name.}
#'   \item{segment_id}{Seven-digit, zero-padded identifier of each
#'     physical street segment. Stable across the LION key when a
#'     segment spans a borough boundary.}
#'   \item{seg_count}{Segment count.}
#'   \item{loc_status}{Local-status flag.}
#'   \item{l_zip, r_zip}{ZIP code on the left / right side of the
#'     segment.}
#'   \item{l_boro, r_boro}{Borough code (1=Manhattan, 2=Bronx,
#'     3=Brooklyn, 4=Queens, 5=Staten Island) for the left / right side.}
#'   \item{l_cd, r_cd}{Community District. Three bytes: borough digit
#'     plus the two-digit district number, or a JIA code for joint
#'     interest areas (parks, airports).}
#'   \item{latomicpolygon, ratomicpolygon}{DCP atomic polygon ID for
#'     left / right side.}
#'   \item{lct2020, lct2020suf}{2020 census tract and suffix, left
#'     side.}
#'   \item{rct2020, rct2020suf}{2020 census tract and suffix, right
#'     side.}
#'   \item{lcb2020, lcb2020suf}{2020 census block and suffix, left
#'     side.}
#'   \item{rcb2020, rcb2020suf}{2020 census block and suffix, right
#'     side.}
#'   \item{l_assm_dist, r_assm_dist}{NYS assembly district, left /
#'     right side.}
#'   \item{l_elect_dist, r_elect_dist}{Election district, left / right
#'     side.}
#'   \item{split_elect}{Split-election-district flag.}
#'   \item{l_schl_dist, r_schl_dist}{School district, left / right
#'     side.}
#'   \item{split_schl}{Split-school-district flag.}
#'   \item{l_sub_sect, r_sub_sect}{Sub-section identifier, left / right
#'     side.}
#'   \item{san_dist_ind}{Sanitation-district indicator.}
#'   \item{map_from, map_to}{Boundary-mapping flags at the `From` and
#'     `To` ends of the segment.}
#'   \item{boro_bndry}{Borough-boundary flag for segments lying along a
#'     borough boundary.}
#'   \item{mh_ri_flag}{Manhattan / Roosevelt-Island flag.}
#'   \item{curve_flag}{Curve flag.}
#'   \item{radius}{Curve radius in feet (0 for non-curved segments).}
#'   \item{node_id_from, node_id_to}{Node IDs at the start and end of
#'     the segment (joins to [nyc_lion_nodes_sf]).}
#'   \item{node_level_f, node_level_t}{Node-level codes at the `From`
#'     and `To` ends.}
#'   \item{con_parity}{Connection-parity flag.}
#'   \item{twisted}{Twisted-segment flag for segments where left /
#'     right are swapped relative to digitization direction.}
#'   \item{rw_type}{Right-of-way type code.}
#'   \item{physical_id}{Physical-segment ID.}
#'   \item{generic_id}{Generic-segment ID.}
#'   \item{nypdid}{NYPD segment identifier, where applicable.}
#'   \item{fdnyid}{FDNY segment identifier, where applicable.}
#'   \item{l_block_face_id, r_block_face_id}{Block-face IDs for the
#'     left / right side of the segment.}
#'   \item{legacy_id}{Legacy segment identifier.}
#'   \item{status}{Segment status code.}
#'   \item{street_width_min, street_width_max}{Minimum and maximum
#'     curb-to-curb street width in feet.}
#'   \item{bike_lane}{Bike-lane class code.}
#'   \item{bike_trafdir}{Bike-traffic direction code.}
#'   \item{posted_speed}{Posted speed limit in miles per hour.}
#'   \item{snow_priority}{Snow-removal priority class.}
#'   \item{number_travel_lanes}{Number of travel lanes.}
#'   \item{number_park_lanes}{Number of parking lanes.}
#'   \item{number_total_lanes}{Total number of lanes (travel +
#'     parking).}
#'   \item{from_left, to_left}{Address range on the left side of the
#'     segment (low / high house numbers).}
#'   \item{from_right, to_right}{Address range on the right side of the
#'     segment.}
#'   \item{join_id}{Identifier used to join LION segments to
#'     [nyc_lion_altnames_df] during geocoding. Concatenates
#'     `Boro` / `face_code` / `lgc1..lgc4`, or, for Special Address
#'     records, `Boro` / `street_code` / `lgc1..lgc4` / `spec_addr`.}
#'   \item{l_pd_service_area, r_pd_service_area}{NYPD service-area
#'     codes for left / right side.}
#'   \item{truck_route_type}{Truck-route classification code.}
#'   \item{SHAPE}{Linestring / multilinestring geometry in EPSG:2263.}
#' }
#' @details
#' Edition 25C, "BYTES of the BIG APPLE", published 2025-08-18 by NYC
#' Department of City Planning. Update frequency is quarterly. LION is
#' spatially aligned with NYCMap aerial photography.
#'
#' For background on `street_code`, the LGC system, `join_id`
#' construction, Joint Interest Areas (community-district codes for
#' major parks and airports), and the conventions for handling
#' alternate / vanity / duplicate street names, see the upstream
#' `ReadMe.txt` and the LION metadata PDF bundled with the source data.
#'
#' @author Kieran Healy
#' @source NYC Department of City Planning, LION
#'   (\url{https://www.nyc.gov/site/planning/data-maps/open-data.page}).
"nyc_lion_sf"
