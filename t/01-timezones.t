use Test;
use IO::Capture::Simple;

use Timezones::US;

lives-ok {
    my $out = capture_stdout { show-us-data };
}

done-testing;

