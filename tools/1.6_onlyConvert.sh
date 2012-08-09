#/bin/bash

#generate 1.6 draft html
xsltproc --xinclude --stringparam base.dir /openils/var/web/evergreen_documentation/1.6/draft/html/ ~/Evergreen_Documentation_Tools/stylesheets/evergreen_docbook_files/evergreen_xhtml.xsl ~/Evergreen_Documentation/rel_1_6/root.xml


#Generate 1.6 PDF via FO
xsltproc --xinclude  --output ~/Evergreen_Documentation/rel_1_6/pdf/temp.fo ~/Evergreen_Documentation_Tools/stylesheets/evergreen_docbook_files/evergreen_fo.xsl ~/Evergreen_Documentation/rel_1_6/root.xml

# must run fop from same directory as root.xml
cd ~/Evergreen_Documentation/rel_1_6

~/doctools/fop/fop -fo pdf/temp.fo -pdf /openils/var/web/evergreen_documentation/1.6/draft/pdf/Evergreen_Documentation.pdf 

# remove temporary .fo file
# rm pdf/temp.fo
