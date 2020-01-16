#!/usr/bin/perl -w

use strict;
chomp (my $date = `date`);
# 或者
$date = localtime;

# 创建新文件*.bak作为备份，空为不备份
$^I = ".bak";

while (<>) {
    s/^Author: .*/Author: Gajanlee/;
    s/^Date: .*/Date: $date/;
    print;
}