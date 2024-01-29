use Test;

use Timezones::US;

lives-ok {
    my $of = "/tmp/data";
    shell "raku -I. ./bin/show-info > $of";
}

done-testing;

