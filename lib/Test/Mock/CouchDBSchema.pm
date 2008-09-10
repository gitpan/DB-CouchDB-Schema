package Test::Mock::CouchDBSchema;
use DB::CouchDB::Schema;
use Moose;
use Moose::Util::TypeConstraints;

=head1 NAME

Test::Mock::CouchDBSchema - A module to make mocking a DB::CouchDB::Schema easier

=head1 SYNOPSIS

=cut

subtype mock_hash => as 'Hash' =>
    where sub {
        my $hash = $_;
        return 1 if (exists $$hash{name} && exists $$hash{code});
        return;
    };

has mocked => (is => 'rw', isa => 'HashRef[mock_hash]');

sub mock_view {
    my $self = shift;
    my $view_name = shift;
    my $view_value = shift;
}

