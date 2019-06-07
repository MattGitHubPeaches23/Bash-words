#!/usr/bin/awk -f
#
# Print word frequencies.
#
# Copyright (c) 2019, Matthew Chalifoux.
#
#
 
BEGIN {
    stopwords="i, me, my, myself, we, our, ours, ourselves, you, you're, you've, you'll, you'd, your, yours, yourself, yourselves, he, him, his, himself, she, she's, her, hers, herself, it, it's, its, itself, they, them, their, theirs, themselves, what, which, who, whom, this, that, that'll, these, those, am, is, are, was, were, be, been, being, have, has, had, having, do, does, did, doing, a, an, the, and, but, if, or, because, as, until, while, of, at, by, for, with, about, against, between, into, through, during, before, after, above, below, to, from, up, down, in, out, on, off, over, under, again, further, then, once, here, there, when, where, why, how, all, any, both, each, few, more, most, other, some, such, no, nor, not, only, own, same, so, than, too, very, s, t, can, will, just, don, don't, should, should've, now, d, ll, m, o, re, ve, y, ain, aren, aren't, couldn, couldn't, didn, didn't, doesn, doesn't, hadn, hadn't, hasn, hasn't, haven, haven't, isn, isn't, ma, mightn, mightn't, mustn, mustn't, needn, needn't, shan, shan't, shouldn, shouldn't, wasn, wasn't, weren, weren't, won, won't, wouldn, wouldn't"
    FS="[^a-zA-Z']" 
    max=0
}

{        
    for(i = 1; i < NF; i++) {        
        sub1=tolower($i)        
        if (stopwords !~ sub1 && sub1 != "") {
            words[sub1]=words[sub1] + 1;
            if(words[sub1] > max){
                max=words[sub1]
            }
        }        
    }    
}

END{
    for(i in words){
        if(2 >= words[i]){
            delete words[i]
        }
    }
    for(i = max; i > 2; i--){
        j=i
        p=0
        taken[p] = ""
        for(k in words){
            if( i == words[k] ){
                taken[p] = k                
                p=p+1                
            }
        }
	    #delete words[k]
        asort(taken,sub4)
        for(m = length(sub4); m > 0; m--) {
		    printf("%20s %-6d\n", sub4[m], j)
	    }
        delete taken
        delete sub4
    }    
}



# STUDY NOTES BELOW STUDY NOTES BELOW STUDY NOTES BELOW STUDY



# asorti(words,order,cmp())
    # for (i in order) {
	# 	print order[i], words[order[i]]
	# }
    # asort(words,order2,cmp())
    # for(i in order2){
    #     print words[i], order2[i]
    # }

    # for(i in order) {
	# 	printf("%20s %-6d\n", i, order[i])
	# }



# if(sub1 == ""){
#    print "HELLO"
#  }

# x=length(stopwords)

# split(stopwords, chars)

    # for (i=1; i <= length(chars); i++) {
    #     printf("%s\n", chars[i])            
    # }

# if (match(sub1, stopwords, m)) {
        #     printf("Hello, %s\n", m[1])
        # }

        # if(i == NF){
        #     print $i
        # }

        # if(!index(stopwords, $i)) {
        #     printf("%s", $i)
        # }

        
        #sub1=tolower($i)

        # if(!match(stopwords,sub1)){

            
        #     printf("%s", sub1)
        # }
