#/bin/bash

#generate draft html
 xsltproc --xinclude --stringparam base.dir /openils/var/web/evergreen_documentation/2.2/ ~/Evergreen_Documentation_Tools/stylesheets/evergreen_docbook_files/evergreen_xhtml-2.2.xsl ~/Evergreen_Documentation/rel_2_2/root.xml


#Generate PDF via FO
 xsltproc --xinclude  --output ~/Evergreen_Documentation/rel_2_2/temp.fo ~/Evergreen_Documentation_Tools/stylesheets/evergreen_docbook_files/evergreen_fo.xsl ~/Evergreen_Documentation/rel_2_2/root.xml

# must run fop from same directory as file
cd ~/Evergreen_Documentation/rel_2_2

~/doctools/fop/fop -fo ~/Evergreen_Documentation/rel_2_2/temp.fo -pdf /openils/var/web/evergreen_documentation/2.2/Evergreen_Documentation.pdf 

# remove temporary .fo file
#  rm ~/Evergreen_Documentation/rel_2_2/temp.fo
