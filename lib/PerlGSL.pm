package PerlGSL;

use strict;
use warnings;

our $VERSION = '0.001';
$VERSION = eval $VERSION;

use base 'Exporter';

our %EXPORT_TAGS;
our @EXPORT_OK;

use PerlGSL::Integration::SingleDim qw/int_1d/;
use PerlGSL::Integration::MultiDim qw/int_multi/;
$EXPORT_TAGS{'integration'} = [ qw/int_1d int_multi/ ];

push @EXPORT_OK, @$_ for values %EXPORT_TAGS;
$EXPORT_TAGS{'all'} = \@EXPORT_OK;

1;


=head1 NAME

PerlGSL - A Collection of Perlish Interfaces to the Gnu Scientific Library

=head1 SYNOPSIS

=head1 DESCRIPTION

L<PerlGSL> defines both a namespace (with certain goals) and a distribution. The aim is to flexibly and modularly provide the GSL to Perl.

=head1 PerlGSL: The Namespace

The name C<PerlGSL> is primarily a concept, a namespace in which to put Perlish interfaces to the Gnu Scientific Library. The GSL provides a large number of C routines for doing scientific/mathematical calculations. To use the GSL from Perl you need to use a I<glue> module which interfaces Perl with the GSL. Perl/C interfaces can come in many flavors; some feel more like C (see L<Math::GSL>) while others strive to feel more like Perl. C<PerlGSL> is meant to be a namespace to collect such modules.

Authors are encouraged to upload your modules to the C<PerlGSL> namespace. For consistency, please attempt to:

=over 

=item *

Use a functional formalism if possible

=item *

Think of mathematical functions as Perl closures if possible

=item *

Wrap your C level functions in Perl level functions for easier argument munging in the future

=item *

Choose your module's name with care and consideration for future authors 

=item *

Don't use the name of the library as the name of your module. Using these names may make it hard for others to name interfaces to the same library. Unfortunately, this may be unavoidable in some cases. In other cases, the library name may be used by central modules to farm out computations to other modules. For example a L<PerlGSL::Integration> library is planned which will smartly farm out integration to the most appropriate solver (by dimensionality and complexity).

=item *

Be sane

=back

=head1 PerlGSL: The Standard Distribution

Beyond defining a namespace, the C<PerlGSL> module is a central module for installing/loading the "Standard" PerlGSL modules. Installing L<PerlGSL> will install all of these modules. Loading L<PerlGSL> does nothing, however loading with a tag (e.g. C<use PerlGSL ':tag';>) will import certain functions from these modules; the number in square brackets indicated the C<PerlGSL> version number that the module was added to the standard distribution. Those tags are:

=over

=item integration

=over 

=item *

C<int_1d> - from L<PerlGSL::Integration::SingleDim> [since 0.001]

=item *

C<int_multi> - from L<PerlGSL::Integration::MultiDim> [since 0.001]

=back

=item all

loads all of the above functions.

=back

Note also that any of the individual functions may be imported individully by name.

If you are an author and would like your module added to this central framework please file a GitHub issue.

=head1 Future Goals

=over

=item * 

Integrate L<PerlGSL> with L<Alien> to provide the GSL library via CPAN

=item *

Continue to add modules to the namespace and the "Stardard Distribution", eventually forming a well rounded GSL implementation.

=back

=head1 Other Perl GSL Bindings

L<PerlGSL> is by no means the only bindings for GSL available via CPAN. Its purpose is to feel Perlish, as such it is slower than a C-level binding set and it is only as complete as authors have provided. Other bindings have other strengths and weaknesses.

=over

=item *

L<PDL::GSL|http://pdl.perl.org/?docs=Modules&title=PDL::Modules#gnu_scientific_library> - L<PDL> is a C-level matrix-like sublanguage for Perl. It is in the vein of MatLab or IDL. It has bindings to many of the GSL libraries. It is fast, but only as Perlish as PDL is itself.

=item *

L<Math::GSL> - This set of bindings is generated by L<SWIG|http://www.swig.org/>; it is therefore ostensibly complete, though this is only partially true. Many modules will still need some massaging before they are functional. Even those that are may feel more like C than Perl.

=back

=head1 SOURCE REPOSITORY

L<http://github.com/jberger/PerlGSL>

=head1 AUTHOR

Joel Berger, E<lt>joel.a.berger@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2012 by Joel Berger

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

The GSL is licensed under the terms of the GNU General Public License (GPL)

