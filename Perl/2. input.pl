#!/usr/bin/perl -w

$line = <STDIN>;    # 直到读到换行符
# chomp($text = <STDIN>)

if ($line eq "\n") {
    print "You input nothing but a break line";
} else {
    print "Got $line";
    chomp($line);   # remove the "\n" in the end of str
    print "Strip get $line";

    $s = chomp $line;   # 0 代表没有\n，1代表有\n
    print "\nThe same result: $line and $s";
}


# `undef` variable is inited by 0 or empty string
while ($n < 10) {
    $sum += $n;
    $n += 2;
}
print "The total number is $sum";


$udf = undef;
if (defined($udf)) {
    print "define";
} else {
    print "undef";
}


# 读取到EOF，换行符分割

@lines = <STDIN>;
chomp(@lines);

chomp(@lines = <STDIN>);