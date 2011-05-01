#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'App::Dropchef' ) || print "Bail out!\n";
}

diag( "Testing App::Dropchef $App::Dropchef::VERSION, Perl $], $^X" );
