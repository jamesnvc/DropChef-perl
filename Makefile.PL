use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'App::Dropchef',
    AUTHOR              => q{James Cash <james.cash@occasionallycogent.com>},
    VERSION_FROM        => 'lib/App/Dropchef.pm',
    ABSTRACT_FROM       => 'lib/App/Dropchef.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'App-Dropchef-*' },
);
