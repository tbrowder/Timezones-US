[![Actions Status](https://github.com/tbrowder/Timezones-US/actions/workflows/linux.yml/badge.svg)](https://github.com/tbrowder/Timezones-US/actions) [![Actions Status](https://github.com/tbrowder/Timezones-US/actions/workflows/macos.yml/badge.svg)](https://github.com/tbrowder/Timezones-US/actions) [![Actions Status](https://github.com/tbrowder/Timezones-US/actions/workflows/windows.yml/badge.svg)](https://github.com/tbrowder/Timezones-US/actions)

NAME
====

**Timezones::US** - Provides US time zone data and subroutines for use with modules 'DateTime::US' and 'LocalTime'

SYNOPSIS
========

```raku
use Timezones::US;
```

DESCRIPTION
===========

Raku module **Timezones::US** provides constant US time zone data (currently valid through the year 2030) to be used by related date and time dynamic modules.

The following table shows the time zones included:

<table class="pod-table">
<caption>US Time Zones</caption>
<thead><tr>
<th>Name</th> <th>Symbol</th> <th>UTC offset (hrs)</th>
</tr></thead>
<tbody>
<tr> <td>Atlantic</td> <td>AST</td> <td>-4,</td> </tr> <tr> <td>Eastern</td> <td>EST</td> <td>-5</td> </tr> <tr> <td>Central</td> <td>CST</td> <td>-6</td> </tr> <tr> <td>Mountain</td> <td>MST</td> <td>-7</td> </tr> <tr> <td>Pacific</td> <td>PST</td> <td>-8</td> </tr> <tr> <td>Alaska</td> <td>AKST</td> <td>-9</td> </tr> <tr> <td>Hawaii-Aleutian</td> <td>HAST</td> <td>-10</td> </tr> <tr> <td>Samoa</td> <td>WST</td> <td>-11</td> </tr> <tr> <td>Chamorro</td> <td>CHST</td> <td>+10</td> </tr>
</tbody>
</table>

### Exported constants

The following constants are automatically exported into the using environment:

  * `SEC-PER-HOUR`

    Seconds per hour: 3600

  * `@tz`

    A list of time zones (lower-case symbols)

  * `%tzones` 

    A hash of all US time zone abbreviations keyed by their symbols (lower-case) with values of names and UTC offsets

  * `%dst-exceptions`

    A hash of US time zone abbreviations keyed by their symbols (lower-case) with values of states or regions and details of Daylight Saving exceptions (**CAUTION**: this an incomplete list at the moment)

  * `%utc-offsets`

    A hash of US time zone abbreviations keyed by their symbols (lower-case) with value of their UTC offset in hours

  * `%offsets-utc`

    A hash of US time zone offsets keyed by their hours with value of their symbols (lower-case) 

### Exported subroutines

The following subroutines are automatically exported into the using environment:

  * **begin-dst**($year --> DateTime) {...}

    Return the time when DST (Daylight Saving Time) begins.

  * **end-dst**($year --> DateTime) {...}

    Return the time when DST ends.

  * **is-dst**(DateTime :$localtime! --> Bool) {...}

    Return True if the local time is DST, otherwise return False.

  * **is-dst**(:$year!, :$month, :$day, :$hour, :$minute, :$second --> Bool) {...}

    Return True if the local time is DST, otherwise return False.

  * **show-us-data**(--> Str) {...}

    List the time zone and DST data being used.

AUTHOR
======

Tom Browder <tbrowder@acm.org>

COPYRIGHT AND LICENSE
=====================

© 2022-2024 Tom Browder

This library is free software; you may redistribute it or modify it under the Artistic License 2.0.

