#!/usr/bin/perl -w

# 确保Perl对不规范的写法不宽容
# 要求用my 声明变量
# 对未定义的变量不能直接赋值
# 比整个屏幕都长的代码应该加上这条
# use strict;


sub marine {
    $n += 1; # global varibale n
    print "Hello, sailor num is $n!\n";
}

&marine;
&marine;
&marine;
&marine;


sub sum_of_fred_and_barnery {
    $fred + $barney; # return value
}

$fred = 3;
$barney = 4;
$wilma = &sum_of_fred_and_barnery;
print "sum of $fred + $barney = $wilma\n";


# 带argument的
sub max {
    if ($_[0] > $_[1]) {
        $_[0];
    } else {
        $_[1];
    }
}

$MAX =  &max(0, 1);
print "Max(0, 1) is $MAX\n";


sub max {
    my($m, $n); # my操作符定义私有变量
    ($m, $n) = @_;

    my($m, $n) = @_;    # 或者这种写法
    if ($m > $n) { $m } else { $n }
}

# 适应任意参数数量
sub max {
    my($max_so_far) = shift @_; # 数组中的第一个值，暂时当为最大值，要求至少有一个数字

    foreach (@_) {
        if ($_ > $max_so_far) {
            $max_so_far = $_;
        }
    }
    return $max_so_far;
}

# my操作符特殊说明
my($num) = @_;  # 列表上下文
my $num = @_;   # 标量上下文

my $fred, $barney;  # 只声明了$fred
my($fred, $barney); # 两个都声明了


# 省略&号调用
sub division {
    $_[0] / $_[1];
}

# 当定义与内置函数同名的子过程的时候，必须使用&
my $quotient = division 355, 113;


use 5.010;
sub marine2 {
    state $n = 0;
    # 不允许声明state列表
    # state @a = qw( a, b, c );
    $n += 1;
    print "Hello state variable is $n\n";
}

&marine2;
&marine2;
&marine2;
&marine2;

