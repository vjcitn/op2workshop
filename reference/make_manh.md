# create a manhattan plot given a study accession and a catalog

create a manhattan plot given a study accession and a catalog

## Usage

``` r
make_manh(sid, catalog, ...)
```

## Arguments

- sid:

  string STUDY ACCESSION

- catalog:

  instance of gwasWloc from gwascat package

- ...:

  passed to ggmanh manhattan_plot

## Examples

``` r
data("gwc_110626", package="op2workshop")
make_manh("GCST90002322", gwc_110626)
#> Loading required namespace: gwascat
#> Warning: Replacing p-value of 0 with the minimum.
```
