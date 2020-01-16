#/usr/bin/perl -w

# 引入新特性
use 5.010;
# Perl 6中的say，相当于println，默认附加\n
say "no break line;";


# 从命令行指定的文件中打开
# perl 5.io.pl t1.txt t2.txt - 
# 从t1.txt中读取文件
# 然后从t2.txt读取
# 然后从 - (标准输入流，直到EOF, Ctrl-D).

@ARGV = qw/ t1.txt t2.txt - /;   # 相同的结果
while(<>) {
    chomp;
    print "It was $_ that I saw\n";
}

print <>;   # 等价于UNIX的cat
print sort <>;  # 等价于UNIX的sort

print (2+3);    # 输出5，函数调用print
print (2+3)*4;  # 输出5，如果函数后面跟着左括号，就会输出括号内的东西，明白什么情况下可以省略括号


$user = lee, $expired = 30;
printf "Hello, %s; your password in %d days!\n", $user, $expired;


# 文件句柄
# Perl保留：STDIN, STDOUT, STDERR, DATA, ARGV, ARGVOUT

open CONFIG, "dino"; # 输入
open CONFIG, "<dino";    # 输入
open BEDROCK, ">fred";   # 输出
open LOG, ">>logfile";   # 附加输出

$filename = ">password.txt";
open FILE, "> $filename";    # 空格被忽略，防止意外转为附加

close FILE;

open FILE, "$filename" or die "Cant't open";65``````````````5555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555`


my $success = open LOG, ">>logfile";
if (! $success) {
    print "操作失败\n";
}

if (! open LOG, ">> logfile") {
    # die, 立刻终止程序
    # warn，只警告，不终止
    die "Open file fatal $!\n"; # $!代表操作系统给的失败的理由，还会额外把Perl代码的文件名和行号也打印出来
} 

while (<LOG>) {
    chomp;
}

print LOG "This is a log";
print (LOG "This is a log");
print LOG ("This is a log");

select LOG; # 修改默认输出位LOG文件，默认为STDOUT
$| = 1; # 不进行缓冲处理，设置一次即可，可以为了设置这个切换一次句柄。
print "Output to logfile";
select STDOUT;  # 使用完，切换回来

printf STDERR "Error Print %s", $user;

# 复用
if (! open STDERR, ">> error.log") {
    die "... $!\n";
}

# 逐行读入内存
while (defined($line = <STDIN>)) {
    print "I saw $line"
}

# 需要一次性都读入内存
foreach (<STDIN>) {
    print "I saw $_";
}



