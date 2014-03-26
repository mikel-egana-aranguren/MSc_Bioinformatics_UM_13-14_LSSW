#!/usr/bin/perl -w

use OBO::Parser::OBOParser;
			
my $my_parser = OBO::Parser::OBOParser->new();
my $ontology = $my_parser->work("go.obo");
			
my $term_1 = $ontology->get_term_by_id("GO:0000800");
my @list1 = @{$ontology->get_ancestor_terms($term_1)};

my $term_2 = $ontology->get_term_by_id("GO:0030685");
my @list2 = @{$ontology->get_ancestor_terms($term_2)};

my @intersection_terms;
foreach (@list1){
        my $itemlist1 = $_;
        foreach (@list2){
                my $itemlist2 = $_;
                if ($itemlist1 eq $itemlist2){
                        push @intersection_terms, $itemlist2;
                }
        }       
}

foreach my $t (@intersection_terms) {
	print $t->name(),"\n";
}


exit 0;
