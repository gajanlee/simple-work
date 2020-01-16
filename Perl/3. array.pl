#!/usr/bin/perl -w

$fred = "Fred";

$fred[0] = "yaba";
$fred[1] = "fred1";
$fred[2] = "fred1";
$fred[3] = "fred3";
$fred[6] = "fred3";

print $fred . "\n";
print $fred[1] . "\n";
print "The last indicator is $#fred\n";
print "The last element is $fred[-1]\n";

$tuple = (1, 2, 3, 4, 5);
@tuple2 = (1..5);
@tuple3 = (1.7..5.7);    # 1, 2, 3, 4, 5
$tuple4 = (0, 2..6, 10, 12);    # 0, 2, 3, 4, 5, 6, 10, 12

print "tuples: $tuple @tuple2 @tuple3 $tuple4\n";

# quoted word
# qw! xxx !
# qw/ xxx /
# qw# xxx #
# qw( xxx )
# qw{ xxx }
# qw[ xxx ]
# qw< xxx >
$lists = qw{
    /usr/bin
    /usr/test
};
print $lists . "\n";

($a, $b, $c, $d, $e) = ( 1..5 );
print $a . "\n";

@list2 = ( 1..10 );
print $list2[-1] . "\n";

# 浅复制
@dup = @list2;

# pop and push
@last = pop(@list2);
push(@list2, 3..10);

# shift and unshift
@array = qw# dino you me #;
@m = shift(@array); # m = dino, array => (you, me)
unshift(@array, "left"); # array => (left, you, me)

@rocks = qw{ st1 st2 st3};
print "print list: @rocks .\n";
print 'print correct (at) @rocks \n' . "\n";


foreach $rock (qw/ bedrock slate lava /) {
    print "One rock is $rock\n";
}
foreach (1..10) {
    # $_代表刚赋值过的变量，免于命名的烦恼
    print "The \$_ is $_\n";
}


# 数组操作符
@fred = reverse 6..10;
@fred = reverse(@fred);
@fred = reverse @fred;

@rocks = qw/ bedrock slate rubble granite /;
@sorted = sort(@rocks);
@back = reverse sort @rocks;
@rocks = sort @rocks;
@numbers = sort 97..102; # 100, 101, 102, 97, 98, 99  并非数字排序！

print "@numbers\n";

@people = qw( fred barney betty );
@sorted = sort @people;
$number = 42 + @people; # 42 + 3
print "$number\n";

@backwards = reverse qw/ yabba dabba doo /;
print "List Context: @backwards\n";
$backwards = reverse qw/ yabba dabba doo /;
print "Scalar Context: $backwards\n";

print "I have ", scalar @backwards, " backwards\n";
