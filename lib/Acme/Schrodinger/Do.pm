package Acme'Schrodinger'Do;
our $VERSION = '0.01';
sub sdo (&;$) {shift->() if defined $_[1] ? $_[1] > rand(100) : 1}
sub import {*{caller().'::sdo'} = \&sdo}
1;
__END__
=head1 NAME

Acme::Schrodinger::Do - do block occasionally

=head1 SYNOPSIS

  use Acme'Schrodinger'Do;
  sdo {kill $the,$cat} '50%';

=head1 DESCRIPTION

You won't know if Perl will do it,
	until you run the script

=head2 EXPORT

sdo BLOCK [Probability]

	sdo {print 'Never Print',"\n"} '0%';              # never print
	sdo {print 'The `%\' can be ommited!',"\n"} 0;    # same as above
	sdo {print 'Just do it!',"\n"} 100;               # like 'do' block
	sdo {print 'Just do it!',"\n"};                   # like 'do' block

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
