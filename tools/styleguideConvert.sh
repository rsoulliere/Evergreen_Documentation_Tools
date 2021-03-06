#/bin/bash

#generate draft html
 xsltproc --xinclude --stringparam base.dir /openils/var/web/evergreen_documentation/style_guide/html/ ~/Evergreen_Documentation_Tools/stylesheets/styleguide/evergreen_xhtml.xsl ~/Evergreen_Documentation_Tools/style_guide/root.xml


#Generate PDF via FO
 xsltproc --xinclude  --output ~/Evergreen_Documentation_Tools/style_guide/pdf/temp.fo ~/Evergreen_Documentation_Tools/stylesheets/styleguide/evergreen_fo.xsl ~/Evergreen_Documentation_Tools/style_guide/root.xml

# must run fop from same directory as root.xml
cd ~/Evergreen_Documentation_Tools/style_guide

 ~/doctools/fop/fop -fo pdf/temp.fo -pdf /openils/var/web/evergreen_documentation/style_guide/pdf/style_guide.pdf 

# remove temporary .fo file
rm pdf/temp.fo
