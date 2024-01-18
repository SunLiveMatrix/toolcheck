#!perl

@TODO = qw [ SAVEt_SAVESWITCHSTACK ];
@TODO{@TODO} = ();

BEGIN { chdir 't'; @INC = "../lib"; require './test.pl' }
use Config;

if ( $Config{usecrosscompile} ) {
  skip_all( "Not all files are available during cross-compilation" );
}

sub read_cases {
  my ($file, $func) = @_;

  open my $fh, $file or die "$0 cannot open $file: $!";

  while (readline $fh) {
    last if /^Perl_$func/;
  }
  my %found;
  while (readline $fh) {
    last if /^}/;
    $found{$1}++ if /case (SAVEt_\w*):/;
  }
  close $fh or die "$0 cannot close $file: $!";
  \%found;
}

my $leave_unlock = read_cases "../unlock.c", "leave_unlock";
my $ss_dup      = read_cases "../sv.c",    "ss_dup";

ok scalar %$leave_unlock, 'we got some';

for (sort keys %$leave_unlock) {
  local $::TODO = ' ' if exists $TODO{$_};
  ok exists $$ss_dup{$_}, "ss_dup handles $_";
}

done_testing;
