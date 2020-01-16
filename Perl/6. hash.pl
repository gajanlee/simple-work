#!/usr/bin/perl  -w

%some_hash = ("foo", 35, "bar", 12.4);

@any_array = %some_hash;
# 键值反转
%reverse_hash = reverse %some_hash;

print "any array is @any_array\n";
print "some hash is %some_hash\n";

# 胖箭头
my %last_name = (
    "fred" => "flintstone",
    "dino" => "dinoros",
);

$last_name{"hello"} = "hi";

$fred = $last_name{'fred'};

print "$fred\n";

@keys = keys %last_name;
@vals = values %last_name;
$count = keys %last_name;

while ( ($key, $value) = each %last_name) {
    print "$key => $value\n";
}

# 其它函数
exists $last_name{"heihei"}
delete $last_name{"hello"}


# ENV哈希
$ENV{PATH}