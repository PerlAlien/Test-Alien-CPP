package Test::Alien::CanCompileCpp;

use strict;
use warnings;
use base 'Test2::Require';
use ExtUtils::CBuilder 0.27;

# ABSTRACT: Skip a test file unless a C++ compiler is available
# VERSION

=head1 SYNOPSIS

 use Test::Alien::CanCompileCpp;

=head1 DESCRIPTION

This is just a L<Test2> plugin that requires that a compiler
be available.  Otherwise the test will be skipped.

=cut

sub skip
{
  ExtUtils::CBuilder->new->have_cplusplus ? undef : 'This test requires a compiler.';
}

1;

=head1 SEE ALSO

=over 4

=item L<Test::Alien>

=back

=cut
