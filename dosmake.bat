@echo off
if %1==env goto env
if %1==demo goto demo
if %1==jar goto jar
if %1==test goto test
if %1==docs goto docs

:env
echo Building the Environment
javac -g -d bin src/uk/ac/nott/cs/g54dia/library/*.java 
copy src\uk\ac\nott\cs\g54dia\library\images\* bin\uk\ac\nott\cs\g54dia\library\images
exit /b

:demo
echo Building the demo tanker
javac -d bin -g -classpath bin src/uk/ac/nott/cs/g54dia/demo/*.java 
exit /b

:jar
echo Building the jar file
jar cmvf src/manifest-addition G54DIA.jar -C bin uk/ac/nott/cs/g54dia/library bin/uk/ac/nott/cs/g54dia/demo/*.class
exit /b

:test
echo Running the demo test
java -jar G54DIA.jar k.ac.nott.cs.g54dia.demo.DemoSimulator
exit /b

:docs
echo Making documentation
javadoc src/uk/ac/nott/cs/g54dia/library/*.java  src/uk/ac/nott/cs/g54dia/demo/*.java -d doc -private
