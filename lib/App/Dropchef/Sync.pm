package App::Dropchef::Sync;

use v5.12;
use strict;
use warnings;
use Carp;

use File::ChangeNotify;
use Parallel::ForkManager;

use Exporter::Easy (
  OK => [ qw(watch) ]
);

=head1 SUBROUTINES/METHODS

=head2 watch

Watches the given directory for newly-added files

=cut

sub watch {
  my ($directory, $callback) = @_;

  croak "$directory is not a directory" unless -d $directory;

  my $watcher = File::ChangeNotify->instantiate_watcher(
    directories => [$directory]
  );

  while ( my @events = $watcher->wait_for_events() ) {
    foreach my $event (@events) {
      $callback->($event);
    }
  }
}

1; # End of App::Dropchef::Sync