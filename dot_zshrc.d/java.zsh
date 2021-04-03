_asdf_tool java adoptopenjdk-11.0.9+11
_asdf_tool maven 3.6.3

# set JAVA_HOME on every change directory
function asdf_update_java_home {
  asdf current java 2>&1 > /dev/null
  if [[ "$?" -eq 0 ]]
  then
      export JAVA_HOME=$(asdf where java)
  fi
}

precmd() { asdf_update_java_home; }
# end set JAVA_HOME
