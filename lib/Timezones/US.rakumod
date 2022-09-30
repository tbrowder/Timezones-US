unit module Timezones::US;

constant SEC-PER-HOUR is export = 3600;

#| All US timezone data are from 'https://timetemperature.com'.
#| List of official abbreviations:
constant @tz is export = <ast est cst
                          mst pst akst
                          hast wst chst>;

#| UTC offsets are in hours (3600 seconds per hour).
#| Keys are the official time zone abbreviations:
constant %tzones is export = [
    ast  => {
              utc-offset  => -4,
              name => "Atlantic",
            },
    est  => {
              utc-offset  => -5,
              name => "Eastern",
            },
    cst  => {
              utc-offset  => -6,
              name => "Central",
            },
    mst  => {
              utc-offset  => -7,
              name => "Mountain",
            },
    pst  => {
              utc-offset  => -8,
              name => "Pacific",
            },
    akst => {
              utc-offset  => -9,
              name => "Alaska",
            },
    hast => {
              utc-offset  => -10,
              name => "Hawaii-Aleutian",
            },
    wst  => {
              utc-offset  => -11,
              name => "Samoa",
            },
    chst => {
              utc-offset  => +10,
              name => "Chamorro",
            },
];

constant %dst-exceptions is export = [
    mst  => {
              az => {
                      name => "Arizona",
                      does-dst => 0,
              }
            },
];
