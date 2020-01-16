#!/usr/bin/perl -w

use warnings;  # 打印警告
# perl -Mdiagnostics template.pl
use diagnostics;  # 打印警告的具体含义

$what = "hello" . "yes " x 3;
$n = 3;
$n **= 3;

print "You said $what $n times\n";


print 3 == 3;
print 3 == 3.0;
print 3 eq 3.0;
print '4' gt '3.0';

$name = "freds";

if ($name ne "fred") {
    print "You are not Fred, you are $name";
}
else {
    print "Your name is $name";
}