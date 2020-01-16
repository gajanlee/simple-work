
# unless

unless ($cond) {

} else {

}

if (!$cond) {

} else {

}

# until，条件为假的while
until ($j > $i) {

}

# if, while

print "$n is a negative\n" if $n < 0;
print " ", ($n += 2) while $n < 10;
$i *= 2 until $i > $j;
&greet($_) foreach @person;
&error("Invalid input") unless &valid($input);


# Counter
my @people = qw{ Fred barney Fred wilma };
my %counter;
$counter{$_}++ foreach @people;

# for, foreach


# 循环控制
while (<STDIN>) {
    if (/__END__/) {
        last;   # break
    } elsif (/fred/) {
        print;
        next;   # continue
        redo;   # 重新执行本轮迭代
    }
}

# 三目操作
my $size = 
    ($width < 10) ? "small" :
    ($width < 20) ? "medium" :
    ($width < 50) ? "large" :
                    "extra-large";


# ||
# 有人的名字是0，可能会有错误
my $last_name = $last_name{$some_one} || 'No last name';
# //，只针对undef变量```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
my $last_name = $last_name{$some_one} // 'No last name';
