use Test::More tests => 1;
BEGIN { use_ok('Acme::Schrodinger::Do') };

sdo {print 'Nothing Occur'} 0;
sdo {print 'I should be printed',"\n"} 100;
