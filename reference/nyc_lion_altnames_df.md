# NYC LION alternate street names

Alternate and alias names for NYC streets, including valid synonyms
(e.g. "Avenue of the Americas" for "6 Avenue") and common misspellings.
Designed to support geocoding against
[nyc_lion_sf](https://kjhealy.github.io/nyclion/reference/nyc_lion_sf.md)
via the `join_id` key.

## Usage

``` r
nyc_lion_altnames_df
```

## Format

### `nyc_lion_altnames_df`

A tibble with 126,954 rows and 7 columns:

- p_dir:

  Pre-directional component (e.g., `"E"`, `"W"`).

- p_type:

  Pre-type component (e.g., `"AVE"` in `"Avenue of..."`).

- s_name:

  Root street name component.

- s_type:

  Suffix type component (e.g., `"ST"`, `"AVE"`).

- s_dir:

  Suffix directional component.

- street:

  Concatenated full street name.

- join_id:

  Geocoding join key to
  [nyc_lion_sf](https://kjhealy.github.io/nyclion/reference/nyc_lion_sf.md).

## Source

NYC Department of City Planning, LION
(<https://www.nyc.gov/site/planning/data-maps/open-data.page>).

## Details

Street names are disaggregated into pre-directional, pre-type, root
name, suffix-type, and suffix-directional components, plus a
concatenated form.

Edition 25C, "BYTES of the BIG APPLE", published 2025-08-18 by NYC
Department of City Planning. Update frequency is quarterly.

## Author

Kieran Healy
