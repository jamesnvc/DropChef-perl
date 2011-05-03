#!perl -T

use v5.12;

use Test::More tests => 2;

BEGIN {
    use_ok( 'App::Dropchef' ) || say "Bail out!";
    use_ok( 'App::DropChef::Sync') || say "Bail out!"
}

diag( "Testing App::Dropchef $App::Dropchef::VERSION, Perl $], $^X" );
