#!perl -T

use v5.12;
use warnings;
use File::Temp qw(tempdir);
use Test::More tests => 1;
use Forks::Super qw(fork);

use App::Dropchef::Sync qw(watch);

my $test_dir = tempdir( CLEANUP => 1 );

my $events = "";
open my $event_fh, '>', \$events;
sub handler {
  say $event_fh @_;
}
my $watch_job = fork {
  sub => \&watch,
  args => [$test_dir, \&handler],
};

sub touch { open my $fh, ">", $_[0]; close $fh; }
my @touched = ();
foreach my $f (qw(foo bar baz quux)) {
  my $path_name = join '/', $test_dir, $f;
  push @touched, $path_name;
  touch($path_name);
}
$watch_job->kill('USR2');

ok $events, 'Number of reported events = number sent events';
