package Log::Log4perl::Appender::TAP;

use strict;
use warnings;
use Test2::API qw( context );
our @ISA = qw( Log::Log4perl::Appender );

# ABSTRACT: Append to TAP output
# VERSION

=head1 SYNOPSIS

 use Test::More tests => 1;
 use Log::Log4perl;
 
 LOG::Log4perl::init(\<<CONF);
 log4perl.rootLogger=ERROR, TAP
 log4perl.appender.TAP=Log::Log4perl::Appender::TAP
 log4perl.appender.TAP.method=diag
 log4perl.appender.TAP=layout=PatternLayout
 log4perl.appender.TAP=layout.ConversionPattern="[%rms] %m%n"
 CONF
 
 DEBUG "this message doesn't see the light of day";
 ERROR "This gets logged to TAP using diag";
 
 pass 'okay';

=head1 DESCRIPTION

This very simple appender sends log output to TAP using
L<Test::Builder>.  It only takes one special argument,
the method, which can be either C<diag> or C<note>.

=cut

sub new
{
  my $proto = shift;
  my $class = ref $proto || $proto;
  my %args = @_;
  bless {
    method  => $args{method} || 'note',
  }, $class;
}

sub log
{
  my $self = shift;
  my %args = @_;
  my $method = $self->{method};
  my $ctx = context();
  $ctx->$method($args{message});
  $ctx->release;
  return;
}

1;
