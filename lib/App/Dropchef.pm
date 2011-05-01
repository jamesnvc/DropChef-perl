package App::Dropchef;

use v5.12;
use strict;
use warnings;

use App::Dropchef::Sync qw(watch);

=head1 NAME

App::Dropchef - The great new App::Dropchef!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

This module implements a Dropbox-based baked blogging engine.

=cut

use Exporter::Easy (
  OK => [ qw(main) ]
);

=head1 SUBROUTINES/METHODS

=head2 main

The main entry point of the program: Load conifg, start watching directories,
begin baking.

=cut

sub main {
}

=head1 AUTHOR

James Cash, C<< <james.cash at occasionallycogent.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-app-dropchef at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=App-Dropchef>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc App::Dropchef


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=App-Dropchef>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/App-Dropchef>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/App-Dropchef>

=item * Search CPAN

L<http://search.cpan.org/dist/App-Dropchef/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2011 James Cash.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of App::Dropchef
