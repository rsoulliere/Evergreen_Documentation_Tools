#Copy files to conversion folders.
cp -R ~/Evergreen-DocBook/* ~/Evergreen_Documentation/rel_2_1/ 

#generate 2.1 html
#xsltproc --xinclude --stringparam base.dir /openils/var/web/evergreen_documentation/2.1/html/ ~/Evergreen_Documentation_Tools/stylesheets/evergreen_docbook_files/evergreen_xhtml-2.1.xsl ~/Evergreen_Documentation/rel_2_1/root.xml


#Generate 2.0 PDF via FO
 xsltproc --xinclude  --output ~/Evergreen_Documentation/rel_2_1/pdf/temp.fo ~/Evergreen_Documentation_Tools/stylesheets/evergreen_docbook_files/evergreen_fo.xsl ~/Evergreen_Documentation/rel_2_1/root.xml

# must run fop from same directory as root.xml
 cd ~/Evergreen_Documentation/rel_2_1
  ~/doctools/fop/fop -fo pdf/temp.fo -pdf /openils/var/web/evergreen_documentation/2.1/pdf/Evergreen_Documentation.pdf 
# rm pdf/temp.fo

