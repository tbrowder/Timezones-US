#!/usr/bin/env raku

use lib "../lib";
use Timezones::US;

for %Timezones::US::utc-offsets.kv -> $k, $v {
    say "key '$k' => value '$v'";
}

for %Timezones::US::offsets-utc.kv -> $k, $v {
    say "key '$k' => value '$v'";
}
