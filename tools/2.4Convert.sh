#generate 2.4 documentation
xsltproc --xinclude --stringparam base.dir /openils/var/web/evergreen_documentation/2.4/ ~/Evergreen_Documentation_Tools/stylesheets/evergreen_docbook_files/evergreen_xhtml-2.4.xsl ~/Evergreen_Documentation/rel_2_4/root.xml


#Generate 2.4 PDF via FO
xsltproc --xinclude  --output ~/Evergreen_Documentation/rel_2_4/pdf/temp.fo ~/Evergreen_Documentation_Tools/stylesheets/evergreen_docbook_files/evergreen_fo.xsl ~/Evergreen_Documentation/rel_2_4/root.xml

# must run fop from same directory as root.xml
cd ~/Evergreen_Documentation/rel_2_4
~/doctools/fop/fop -fo pdf/temp.fo -pdf /openils/var/web/evergreen_documentation/2.4/Evergreen_Documentation.pdf 
#rm pdf/temp.fo

