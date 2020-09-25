# perl_snippets

Comments : # single line only  for commonets no multiline comments 

Help : # perdoc for any command help 


Read from file:

Method: 1

```
my $filename = "linesfile.txt";  
open(FH, $filename);    # open the file
my @lines = <FH>;       # read the file
close(FH);              # close the file
```

Method 2:

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

Method 3: 

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

Assigment : = servers as simple assigmnet operator in perl 
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
