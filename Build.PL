use strict;
use warnings;

use 5.008000;
use Module::Build;

chomp( my $gsl_version = qx/ gsl-config --version / );

my $can_diffeq = 0;
if ( defined $gsl_version and $gsl_version >= 1.15 ) {
  $can_diffeq = 1;
} else {
  print "PerlGSL::DiffEq requires GSL version >= $min_gsl_version\n"
}

my $build = Module::Build->new(
    module_name       => 'PerlGSL::DiffEq',
    dist_version_from => 'lib/PerlGSL/DiffEq.pm',
    dist_abstract     => 'A Collection of Perlish Interfaces to the GSL',
    dist_author       => 'Joel Berger <joel.a.berger@gmail.com>',
    license           => 'perl',
    requires          => {
      'perl' => '5.008',
      parent => 0,
      'PerlGSL::Integration::SingleDim' => 0.001,
      'PerlGSL::Integration::MultiDim' => 0.002,
      $can_diffeq ? ( 'PerlGSL::DiffEq' => 0.08 ) : (),
    },
    recommends => {
      'PerlGSL::DiffEq' => 0.08,
    }
    configure_requires => {
      'Module::Build' => 0.38,
    },
  meta_merge => {
    resources  => {
      repository => "http://github.com/jberger/PerlGSL",
      bugtracker => "http://github.com/jberger/PerlGSL/issues",
    },
    no_index => {
      file => [ 'README.pod' ],
    },
  },
);

$build->create_build_script;

