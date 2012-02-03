
#generate 2.0 draft html
xsltproc --xinclude --stringparam base.dir /openils/var/web/evergreen_documentation/2.0/draft/html/ ~/Evergreen_Documentation_Tools/stylesheets/evergreen_docbook_files/evergreen_xhtml-2.0.xsl ~/Evergreen_Documentation/rel_2_0/root.xml


#Generate 2.0 PDF via FO
 xsltproc --xinclude  --output ~/Evergreen_Documentation/rel_2_0/pdf/temp.fo ~/Evergreen_Documentation_Tools/stylesheets/evergreen_docbook_files/evergreen_fo.xsl ~/Evergreen_Documentation/rel_2_0/root.xml

# must run fop from same directory as root.xml
 cd ~/Evergreen_Documentation/rel_2_0
  ~/doctools/fop/fop -fo pdf/temp.fo -pdf /openils/var/web/evergreen_documentation/2.0/draft/pdf/Evergreen_Documentation.pdf 
 rm temp.fo

