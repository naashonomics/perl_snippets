# perl_snippets

# Comments : # single line only  for commonets no multiline comments 

# Help : # perdoc for any command help 


# Read from file:

# Method: 1

```
my $filename = "linesfile.txt";  
open(FH, $filename);    # open the file
my @lines = <FH>;       # read the file
close(FH);              # close the file
```

# Method 2:

```
use IO::File;
my $filename = "linesfile.txt"; # the name of the file

# open the file - with simple error reporting
my $fh = IO::File->new( $filename, "r" );
if(! $fh) {
    print("Cannot open $filename ($!)\n");
    exit;
}

# count the lines
my $count = 0;
while( $fh->getline ) {
    $count++;
}

# close and print
$fh->close;
print("There are $count lines in $filename\n");
```

# Method 3: 

```
# entry point

sub main
{
    my $filename = shift || "linesfile.txt";
    my $count = countlines( $filename );
    say "There are $count lines in $filename";
}

# countlines ( filename ) - count the lines in a file

# returns the number of lines
sub countlines
{
    my $filename = shift;
    error("countlines: missing filename") unless $filename;

    # open the file
    my $fh = IO::File->new( $filename, "r" ) or
        error("Cannot open $filename ($!)\n");
    
    # count the lines
    my $count = 0;
    $count++ while( $fh->getline );
    
    $fh->close;
    
    # return the result
    return $count;    
}

# error ( string ) - display an error message and exit

sub error
{
    my $e = shift || 'unkown error';
    say "$0: $e";
    exit 0;
}
```

 An expression is anything that returns a value , In Perl an expression is anything that returns a value. In practice, just about everything in Perl returns a value. 
```
 my $filename = shift || "linesfile.txt";
```
Semicolon is used to separate statements. A statement is an instruction to the computer to do something. These concepts overlap quite a bit in Perl, but that's expected given the nature of Perl.
 
  
```
 say "Hello";
```

# Assigment : = servers as simple assigmnet operator in perl 
```
my $a=10;
#my keyword gives  variable local space in file 
```

Perl also supports compound assigment 
```
$a += 100
#coumpounds both additonal operator with assignment operator 
```

Block and Scope


 Example 1 
```
my $alpha = 'alpha';
my $beta = 'beta';
my $charlie = 'charlie';

func();

sub func {
    foreach my $x ( $alpha, $beta, $charlie ) {
        say $x;
    }
}
#O/P
# alpha 
# beta
# charlie
```

 Example 2
```
my $alpha = 'alpha';
my $beta = 'beta';
my $charlie = 'charlie';

func();

sub func {
    my $beta = 'new-beta';
    foreach my $x ( $alpha, $beta, $charlie ) {
        say $x;
    }
}
#O/P
# alpha 
# new-beta
# charlie
```




# Basic Perl Storage Types

1> Scalar holds a single value
```
$scalar = 
```
    
 2> Array Holds a Series of values 
 
     ```
    @Array = 
    ```
    
 3> Hash holds an associative series of values 
 
    ```
    my %hash = ( one => 'uno', two => 'dos', three => 'tres', four => 'quatro', five => 'cinco' );

    while( my ($k, $v) = each %hash ) {
    say "$k -> $v";}
    ```
    
#  PERL References 

A scalar that refers to an another object 
 
    ```
    $rarray = \@array
    $rhash =\%hash
    ```

# Constant Pragma 
Perl doesn't actually include Constants in the Definition of the Language. However, the standard Distribution does include a Pragma for this purpose.
 
```
use constant PI => 3.141592653589793238462643383279;
use constant TRUE => 1;
use constant FALSE => '';

say PI;

if (TRUE) {
    say 'true';
} else {
    say 'false';
```

# LOOPS

# if 
```
my $x = 1;
my $y = 1;

if ( $x == 1 ) {
    say 'true';
}

``` 

# else and elsif 
```
my $x = 1;
my $y = 1;

if ( $x == 47 ) {
    say 'true';
}
elsif ( $x==6) {
    say "six";
} 
else {
    say "else";
}

``` 

# Negative Conditional 
```
my $x = 7;
my $y = 1;

unless ($x==7){
    say "unless"
} 
else {
    say "else"
}
```


# Switch with given and when ( Do not use in production code) 

```
my $x = 1;
my $y = 2;
my $z = 3;
my $v = $x;
give ($v) {
    when ($x) {say $x ;}
}
```

# The ternary conditional operator 

```
my $x = 1;
my $y = 5;

say $x > $y ? 'x' : 'y' ;
```

# Loops

# 1> For 2> Foreach 3> while 4> until 5> next 6> last 7> continue 

```
my $x = 'three';
my @array = qw( one two three four five );

my $count = 0;
while ($array[$count]) {
    say "$count: $array[$count]";
} continue {
    ++$count;
}

for( my $count = 0; $array[$count]; ++$count ) {
    say "$count: $array[$count]";
}
```

# special  Variables 

# default 

```
$_ = 'Hello';

print;


func1('one', 'two', 'three');

sub func1 {
    say 'this is func1';
    say foreach @_;
}

```
# autoflush 

```

$| =1 ; # Autoflish 
main();

sub main {
    print "What is your favorite number? ";
    my $num = <STDIN>;
    my $mine = better_number($num);
    print "\nReally? My favorite number is $mine, which is a much better number.\n";
}

sub better_number {
    my $num = shift || 6;
    $num = 6 unless $num =~ /^[0-9]+$/;
    return $num + int(rand(10)) + 1;
}

```

# The system error variable

```
my $filename = 'notfound.txt';

if (-e $filename ) {

    say 'found!';
} else {
    my $errorstring =  $! ;
    my $errornumber = $! + 0 ;
    say "error: $errornumber  $errorstring"; 
}
```

 

# Regular Expressions 

# match

```
my $s = "This is a line of text";

if ( $s =~ /line/ ) {
    say 'True';
} else {
    say 'False';
}

#ignore case
my $s = "This is a line of text";

if ( $s =~ /line/i ) {
    say 'True';
} else {
    say 'False';
}
```

# pre compiled regular expression 

```
my $s = "This is a line of text";
my $re = qr/line/;
say $s =~ $re ? 'True' : 'Flase'
```

# wildcards

```
my $s = "This is a line of text";

if ( $s =~ /(text)/ ) {
    say "Match is: $1";
} else {
    say 'False';
}
```


# What's the difference between Perl's backticks, system, and exec?

# exec : executes a command and never returns. It's like a return statement in a function If the command is not found, exec returns false. It never returns true

```
my $data2 = exec('ls');
```

# system : system executes a command and your Perl script is resumed after the command has finished. The return value is the exit status of the command. You can find documentation about it in perlfunc. 

```
my $data2 = system('ls');
```

# backticks (`) : Like system, enclosing a command in backticks executes that command and your Perl script is resumed after the command has finished. In contrast to system, the return value is STDOUT of the command 

```
my $data2 = `ls`;
```


