#!/usr/bin/perl

use OBO::Parser::OBOParser;
			
my $my_parser = OBO::Parser::OBOParser->new();
my $ontology = $my_parser->work("go.obo");
			
my $interesting_term = $ontology->get_term_by_id("GO:0007049");			
my @descendents = @{$ontology->get_descendent_terms($interesting_term)};

open (FILE, 'gene_association.tair');
while (<FILE>) {
	chomp;
	($DB, $DB_Object_ID, $DB_Object_Symbol,$Qualifier,$GO_ID) = split("\t");
	foreach my $t (@descendents) {
		if($t->id() eq $GO_ID){
		  print $DB_Object_Symbol,"\n";
		}
	}
}

close (FILE);
exit;
			
