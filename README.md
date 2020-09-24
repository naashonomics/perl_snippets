# perl_snippets

Comments : # single line only  for commonets no multiline comments 

Help : # perdoc for any command help 


Read from file:

Method: 1
my $filename = "linesfile.txt";  
open(FH, $filename);    # open the file
my @lines = <FH>;       # read the file
close(FH);              # close the file
  
Method 2:
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

Method 3: 

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
