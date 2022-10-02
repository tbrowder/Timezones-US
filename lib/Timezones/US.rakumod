unit module Timezones::US;

constant SEC-PER-HOUR is export = 3600;

#| All US time zone data are from 'https://timetemperature.com'.
#| List of official abbreviations:
constant @tz is export = <
                ast est cst
                mst pst akst
                hast wst chst
               >;

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

constant %utc-offsets is export = [
    ast  => -4,
    est  => -5,
    cst  => -6,
    mst  => -7,
    pst  => -8,
    akst => -9,
    hast => -10,
    wst  => -11,
    chst => +10,
];

constant %offsets-utc is export = %utc-offsets.invert;

# subroutines
sub is-dst(DateTime :$localtime --> Bool) is export {
    my $t = $localtime;
    my $year = $t.year;

    my $start-time = begin-dst $year;
    my $end-time   = end-dst $year;

    # now we can check if in or out
    if $t < $start-time {
        return False;
    }
    elsif $t > $end-time {
        return False;
    }
    else {
        return True
    }
}

sub begin-dst($year! --> DateTime) is export {
   # second Sunday in March
   # get day-of-week for yyyy-03-01
   my $day1 = Date.new: :$year, :3month, :1day;
   my $dow  = $day1.day-of-week; # 1..7 (Mon..Sun)
   my $day-skip = 7 - $dow;

   my $sunday = $day1 + $day-skip;
   my $wdom = $sunday.weekday-of-month; # 1..5
   die "FATAL: day $sunday is not the first, it's Sunday {$wdom} of March" if $wdom != 1;
   my $dst = $sunday + 7;
   my $dst-begin = DateTime.new: :date($dst), :2hour, :0minute, :0second;
}

sub end-dst($year --> DateTime) is export {
   # first Sunday in November
   # get day-of-week for yyyy-11-01
   my $day1 = Date.new: :$year, :11month, :1day;
   my $dow  = $day1.day-of-week; # 1..7 (Mon..Sun)
   my $day-skip = 7 - $dow;

   my $sunday = $day1 + $day-skip;
   my $wdom = $sunday.weekday-of-month; # 1..5
   die "FATAL: day $sunday is not the first, it's Sunday {$wdom} of November" if $wdom != 1;
   my $dst = $sunday;
   my $dst-end = DateTime.new: :date($dst), :2hour, :0minute, :0second;
}

sub show-us-data(--> Str) is export {
    say "US time zone and DST data";
    say "========================";

    say "Time zones";
    say "----------";
    for @tz -> $tz {
        my $nam  = %tzones{$tz}<name>;
        my $name = $nam ~ ' Standard Time';
        my $oset = %tzones{$tz}<utc-offset>;
        $oset = $oset > 0 ?? '+' ~ $oset !! $oset;
        my $exc  = %dst-exceptions{$tz.lc}:exists ?? 'Yes' !! 'No';
        #print qq:to/HERE/;
        say qq:to/HERE/;
        {$tz.uc} - $name
            Offset from UTC: $oset
            Exceptions to DST? $exc
        HERE
    }

    say "DST exceptions";
    say "--------------";
    for @tz -> $tz {
        next unless %dst-exceptions{$tz}:exists;
        my $nam  = %tzones{$tz}<name>;
        my $name = $nam ~ ' Standard Time';
        say $name;
        my %h = %(%dst-exceptions{$tz});
        for %h.keys.sort -> $k {
            my $name = %h{$k}<name>;
            my $dst = %h{$k}<does-dst>;
            my $exc  = $dst ?? 'Yes' !! 'No';
            say "  $name";
            say "    Does DST? $exc";
        }
    }
}
