BEGIN{unshift @INC, "./lib"; require Devel::Symdump}
use ExtUtils::MakeMaker;
$Verbose=1;
WriteMakefile(
	      NAME => "Devel::Symdump",
	      DISTNAME => "Symdump",
	      VERSION => $Devel::Symdump::VERSION,
	      'linkext' => {LINKTYPE => '' },
	      'clean' => {FILES => '*/*/*~'},
	      'dist' => {COMPRESS=>'gzip -9f', SUFFIX=>'gz', 
			 DIST_DEFAULT => 'ci tardist'},
	      'macro' => {CONFIGDEP => 'lib/Devel/Symdump.pm'}
	     );
