package Acme'Schrodinger'Do;
our $VERSION = '0.04';
sub import {
	my $c = caller();
	*{$c.'::sdo'} = sub (&;$$) {for(1..(defined $_[2] ? $_[2] : 1)){$_[0]->() if defined $_[1] ? $_[1] > rand(100) : 1}};
	*{$c.'::doAny'} = sub(&;@){$_[int(rand(100)/(100/scalar(@_)))]->();}}
1;
__END__
=head1 NAME

Acme::Schrodinger::Do - do block occasionally

=head1 SYNOPSIS

  use Acme'Schrodinger'Do;
  sdo {kill $the,$cat} '50%';
  sdo {kill $the,$cat} 50 => 10                       # 10 boxes and cats
  doAny {kill $cat, $number1}
    sub {kill $cat, $number2}
  , sub {kill $cat, $number3}
  , sub {kill $cat, $number4};                        # do any one block

=head1 DESCRIPTION

You won't know if Perl will do it,
	until you run the script

=head2 EXPORT

sdo BLOCK
sdo BLOCK Probablilty
sdo BLOCK Probability => Iterate

	sdo {print 'Never Print',"\n"} '0%';              # never print
	sdo {print 'The `%\' can be ommited!',"\n"} 0;    # same as above
	sdo {print 'Just do it!',"\n"} 100;               # like 'do' block
	sdo {print 'Just do it!',"\n"};                   # like 'do' block
	sdo {print 'do it three times!'} 100 => 3;        # do for 1..3

doAny BLOCK(S)

	doAny {'???'}               # (100/1)% doing block
	doAny {'???'} sub {'???'}   # (100/2)% foreach block
	doAny {'???'} 
	  sub {'???'}
	, sub {'???'};              # (100/3)% for each block

=head1 SEE ALSO

http://en.wikipedia.org/wiki/Schr%C3%B6dinger%27s_cat

=head1 AUTHOR

Kwok Lok Chung, Baggio <rootkwok@cpan.org>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by Kwok Lok Chung, Baggio

THIS LIBRARY IS FREE SOFTWARE;
YOU CAN REDISTRIBUTE IT AND/OR MODIFY IT UNDER THE SAME TERMS AS Perl ITSELF
AT YOUR OPTION, ANY LATER VERSION OF Perl 5 YOU MAY HAVE AVAILABLE.

=cut
