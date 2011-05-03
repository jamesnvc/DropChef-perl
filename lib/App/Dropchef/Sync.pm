package App::Dropchef::Sync;

use v5.12;
use strict;
use warnings;
use Carp;
use Scalar::Util qw(reftype);

use File::ChangeNotify;

use Exporter::Easy (
  OK => [ qw(watch) ]
);

=head1 SUBROUTINES/METHODS

=head2 watch

Watches the given directory for newly-added files

=cut

sub watch {
  my ($directory, $callback_ref) = @_;

  croak "$directory is not a directory" unless -d $directory;
  croak "Invalid callback" unless reftype $callback_ref eq 'CODE';

  my $watcher = File::ChangeNotify->instantiate_watcher(
    directories => [ $directory ]
  );

  $SIG{USR2} = sub {
    my @events = $watcher->new_events();
    process_events( $callback_ref, \@events );
    exit;
  };

  while ( my @events = $watcher->wait_for_events() ) {
    process_events( $callback_ref, \@events );
  }

  return; # Never reached
}

=head2 process_events

Helper method to execute the given callback on each newly-created file.

=cut

sub process_events {
  my ($callback_ref, $events_ref) = @_;
  foreach my $event (@{$events_ref}) {
    if ($event->type eq 'create') {
      $callback_ref->($event->path);
    }
  }
}

1; # End of App::Dropchef::Sync
