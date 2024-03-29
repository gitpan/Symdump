package Devel::Symdump::Export;
require Devel::Symdump;
require Exporter;
use Carp;
@ISA=('Exporter');

@EXPORT_OK=(
	'packages'	,
	'scalars'	,
	'arrays'	,
	'hashes'	,
	'functions'	,
	'filehandles'	,
	'dirhandles'	,
	'unknowns'	,
);
my %OK;
@OK{@EXPORT_OK}=(1) x @EXPORT_OK;

push @EXPORT_OK, "symdump";

# undocumented feature symdump() -- does it save enough typing?
sub symdump {
    my @packages = @_;
    Devel::Symdump->new(@packages)->as_string;
}

AUTOLOAD {
    my @packages = @_;
    (my $auto = $AUTOLOAD) =~ s/.*:://;
    confess("Unknown function call $auto") unless $OK{$auto};
    my @ret = Devel::Symdump->new->$auto(@packages);
    return @ret;
}

1;
