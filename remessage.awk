#!/usr/bin/awk -f

NR==1 && /Fixes \#546 by using level-3 headings in all Markdown source files for subsections\./ {
    print "Fixes #546 by using level-3 headings in all Markdown source files for subsections";
    print "";
    print "We continue to use level-4 headings for objectives, key points, callout boxes, and challenges.";
    next;
}

NR==1 && /In the novice shell lesson 03-pipefilter, changed sort to sort -n\./ {
    print "In the novice shell lesson 03-pipefilter, changed sort to sort -n";
    print "";
    print "In the lesson , the \"sort\" command is used to demonstrate sorting line counts.";
    print "The lesson as written does not produce the given output on the bash shell (but does on Mac OS X terminal).";
    print "By adding the -n to sort, the example should behave the same across all platforms.";
    next;
}

NR==1 && /Corrects runtime calculation for goostat and goodiff\./ {
    print "Corrects runtime calculation for goostat and goodiff";
    print "";
    print "300 choose 2 is 300*299/2.";
    print "Also the conversion from seconds to weeks was off.";
    next;
}

NR==1 && /1\.\s+Making filenames in `find` example match filenames/ {
    print "find: Use -print and adjust filenames to match the diagrams";
    print "";
    print "1.  Making filenames in `find` example match filenames in diagram.";
    print "2.  Using `-print` with `find`.";
    next;
}

{print}
