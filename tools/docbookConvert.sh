#/bin/bash

#generate 2.2 documentation
xsltproc --xinclude --stringparam base.dir /openils/var/web/evergreen_documentation/2.2/ ~/Evergreen_Documentation_Tools/stylesheets/evergreen_docbook_files/evergreen_xhtml-2.2.xsl ~/Evergreen_Documentation/rel_2_2/root.xml


#Generate 2.2 PDF via FO
 xsltproc --xinclude  --output ~/Evergreen_Documentation/rel_2_2/pdf/temp.fo ~/Evergreen_Documentation_Tools/stylesheets/evergreen_docbook_files/evergreen_fo.xsl ~/Evergreen_Documentation/rel_2_2/root.xml

# must run fop from same directory as root.xml
 cd ~/Evergreen_Documentation/rel_2_2
  ~/doctools/fop/fop -fo pdf/temp.fo -pdf /openils/var/web/evergreen_documentation/2.2/Evergreen_Documentation.pdf 
 rm temp.fo


#generate 2.1 draft html
xsltproc --xinclude --stringparam base.dir /openils/var/web/evergreen_documentation/2.1/html/ ~/Evergreen_Documentation_Tools/stylesheets/evergreen_docbook_files/evergreen_xhtml-2.1.xsl ~/Evergreen_Documentation/rel_2_1/root.xml


#Generate 2.1 PDF via FO
 xsltproc --xinclude  --output ~/Evergreen_Documentation/rel_2_1/pdf/temp.fo ~/Evergreen_Documentation_Tools/stylesheets/evergreen_docbook_files/evergreen_fo.xsl ~/Evergreen_Documentation/rel_2_1/root.xml

# must run fop from same directory as root.xml
 cd ~/Evergreen_Documentation/rel_2_1
  ~/doctools/fop/fop -fo pdf/temp.fo -pdf /openils/var/web/evergreen_documentation/2.1/pdf/Evergreen_Documentation.pdf 
 rm temp.fo

#generate 2.0 draft html
# xsltproc --xinclude --stringparam base.dir /openils/var/web/evergreen_documentation/2.0/draft/html/ ~/Evergreen_Documentation_Tools/stylesheets/evergreen_docbook_files/evergreen_xhtml-2.0.xsl ~/Evergreen_Documentation/rel_2_0/root.xml


#Generate 2.0 PDF via FO
# xsltproc --xinclude  --output ~/Evergreen_Documentation/rel_2_0/pdf/temp.fo ~/Evergreen_Documentation_Tools/stylesheets/evergreen_docbook_files/evergreen_fo.xsl ~/Evergreen_Documentation/rel_2_0/root.xml

# must run fop from same directory as root.xml
# cd ~/Evergreen_Documentation/rel_2_0
#  ~/doctools/fop/fop -fo pdf/temp.fo -pdf /openils/var/web/evergreen_documentation/2.0/draft/pdf/Evergreen_Documentation.pdf 
# rm temp.fo



#generate 1.6 draft html
#xsltproc --xinclude --stringparam base.dir /openils/var/web/evergreen_documentation/1.6/draft/html/ ~/Evergreen_Documentation_Tools/stylesheets/evergreen_docbook_files/evergreen_xhtml.xsl ~/Evergreen_Documentation/rel_1_6/root.xml


#Generate 1.6 PDF via FO
#xsltproc --xinclude  --output ~/Evergreen_Documentation/rel_1_6/pdf/temp.fo ~/Evergreen_Documentation_Tools/stylesheets/evergreen_docbook_files/evergreen_fo.xsl ~/Evergreen_Documentation/rel_1_6/root.xml

# must run fop from same directory as root.xml
#cd ~/Evergreen_Documentation/rel_1_6

#~/doctools/fop/fop -fo pdf/temp.fo -pdf /openils/var/web/evergreen_documentation/1.6/draft/pdf/Evergreen_Documentation.pdf 

# remove temporary .fo file
#rm temp.fo

