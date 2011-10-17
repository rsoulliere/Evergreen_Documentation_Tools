#/bin/bash

#generate 2.0 draft html
xsltproc --xinclude --stringparam base.dir /openils/var/web/evergreen_documentation/2.0/draft/html/ ~/Evergreen_Documentation_Tools/stylesheets/evergreen_docbook_files/evergreen_xhtml-2.0.xsl ~/rel_2_0/root.xml


#Generate 2.0 PDF via FO
 xsltproc --xinclude  --output ~/rel_2_0/pdf/temp.fo ~/Evergreen_Documentation_Tools/stylesheets/evergreen_docbook_files/evergreen_fo.xsl ~/rel_2_0/root.xml

# must run fop from same directory as root.xml
 cd ~/rel_2_0
  ~/doctools/fop/fop -fo pdf/temp.fo -pdf /openils/var/web/evergreen_documentation/2.0/draft/pdf/Evergreen_Documentation.pdf 
 rm temp.fo

#generate 1.6 draft html
xsltproc --xinclude --stringparam base.dir /openils/var/web/evergreen_documentation/1.6/draft/html/ ~/Evergreen_Documentation_Tools/stylesheets/evergreen_docbook_files/evergreen_xhtml.xsl ~/rel_1_6/root.xml


#Generate 1.6 PDF via FO
xsltproc --xinclude  --output ~/rel_1_6/pdf/temp.fo ~/Evergreen_Documentation_Tools/stylesheets/evergreen_docbook_files/evergreen_fo.xsl ~/rel_1_6/root.xml

# must run fop from same directory as root.xml
cd ~/rel_1_6

~/doctools/fop/fop -fo pdf/temp.fo -pdf /openils/var/web/evergreen_documentation/1.6/draft/pdf/Evergreen_Documentation.pdf 

# remove temporary .fo file
rm temp.fo
