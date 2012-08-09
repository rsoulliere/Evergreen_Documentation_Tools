#generate 2.2 documentation
xsltproc --xinclude --stringparam base.dir /openils/var/web/evergreen_documentation/2.2/ ~/Evergreen_Documentation_Tools/stylesheets/evergreen_docbook_files/evergreen_xhtml-2.2.xsl ~/Evergreen_Documentation/rel_2_2/root.xml


#Generate 2.2 PDF via FO
 xsltproc --xinclude  --output ~/Evergreen_Documentation/rel_2_2/pdf/temp.fo ~/Evergreen_Documentation_Tools/stylesheets/evergreen_docbook_files/evergreen_fo.xsl ~/Evergreen_Documentation/rel_2_2/root.xml

# must run fop from same directory as root.xml
 cd ~/Evergreen_Documentation/rel_2_2
  ~/doctools/fop/fop -fo pdf/temp.fo -pdf /openils/var/web/evergreen_documentation/2.2/Evergreen_Documentation.pdf 
# rm pdf/temp.fo


