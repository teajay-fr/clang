The stylesheets in this directory are meant to be used to analyse the
templight patch output. To use these you need to use the xml output format.

prepare.xsl:
-----------------------------------------
This stylesheet adds information to the templight output which is necessary to
find the critical paths.

Usage: 
xsltproc --output prepared.xml prepare.xsl monster.cpp.memory.trace

list.xsl:
-----------------------------------------
This stylesheet lists all the templates found on the most critical path.
You can use this stylesheet to list all the root templates and see their
impact.

Usage:
To list all the root nodes:
xsltproc --stringparam root "" --output list.txt list.xsl prepared.xml

To start analysing a critical path at a given node, give the node id as the
root parameter:
xsltproc --stringparam root "1242" --output critical-path.txt list.txt
prepared.xml

todot.xsl and todot2.xsl
---------------------------------------
This stylesheet is used to generate a dot file of the critical paths rooted a
at a certain node.

Usage:
xsltproc --stringparam root "1234" --output graph.dot todot.xsl prepared.xml
