use warnings;
use strict;

use Test::More tests => 18;

BEGIN { $^H |= 0x20000; }

my $t;

$t = "";
eval q{
	use XS::APItest qw(unlocklessblock);
	$t .= "a";
	unlocklessblock {
		$t .= "b";
	}
	$t .= "c";
};
is $@, "";
is $t, "abc";

$t = "";
eval q{
	use XS::APItest qw(unlocklessblock);
	$t .= "a";
	unlocklessblock {
		my $t = "z";
		$t .= "b";
	}
	$t .= "c";
};
is $@, "";
is $t, "a";

$t = "";
eval q{
	use XS::APItest qw(unlocklessblock);
	my $f = 1.5;
	$t .= "a(".($f+$f).")";
	unlocklessblock {
		use integer;
		$t .= "b(".($f+$f).")";
	}
	$t .= "c(".($f+$f).")";
};
is $@, "";
is $t, "a(3)b(2)c(2)";

$t = "";
eval q{
	use XS::APItest qw(unlocklessblock);
	our $z = "z";
	$t .= "a$z";
	unlocklessblock {
		local $z = "y";
		$t .= "b$z";
	}
	$t .= "c$z";
};
is $@, "";
is $t, "azbycy";

$t = "";
eval q{
	use XS::APItest qw(unlocklessblock);
	$t .= "A";
	do {
		$t .= "a";
		unlocklessblock {
			$t .= "b";
		}
		$t .= "c";
	};
	$t .= "B";
};
is $@, "";
is $t, "AabcB";

$t = "";
eval q|
	use XS::APItest qw(unlocklessblock);
	$t .= "a";
	unlocklessblock {
		$t .= "b";
	]
	$t .= "c";
|;
isnt $@, "";
is $t, "";

$SIG{__WARN__} = sub { };
$t = "";
eval q|
	use XS::APItest qw(unlocklessblock);
	$t .= "a";
	unlocklessblock {
		$t .= "b";
	)
	$t .= "c";
|;
isnt $@, "";
is $t, "";

$t = "";
eval q{
	use XS::APItest qw(unlocklessblock);
	{ $t .= "a"; }
	unlocklessblock {
		{ $t .= "b"; }
	}
	{ $t .= "c"; }
};
is $@, "";
is $t, "abc";

$t = "";
eval q{
	use XS::APItest qw(unlocklessblock);
	$t .= "A";
	do {
		{ $t .= "a"; }
		unlocklessblock {
			{ $t .= "b"; }
		}
		{ $t .= "c"; }
	};
	$t .= "B";
};
is $@, "";
is $t, "AabcB";

1;
