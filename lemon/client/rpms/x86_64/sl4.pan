template monitoring/lemon/client/rpms/x86_64/sl4;


# files /etc/lemon/agent/[metrics|sensor]/linux.conf conflict with previous RPM
#"/software/packages"=pkg_repl("lemon-sensor-linux","1.0.2-1","x86_64");

"/software/packages"=pkg_repl("perl-TimeDate","2.22-1","noarch");
"/software/packages"=pkg_repl("compat-libstdc++-33","3.2.3-47.3","x86_64");
"/software/packages"=pkg_repl("lemon-agent","3.0.1-1","x86_64");
"/software/packages"=pkg_repl("lemon-xml-api","1.0.0-1","x86_64");
"/software/packages"=pkg_repl("lemon-sensor-devel","1.0.1-1","x86_64");
"/software/packages"=pkg_repl("lemon-sensor-exception","1.4.5-1","x86_64");
"/software/packages"=pkg_repl("lemon-sensor-file","1.0.0-1","x86_64");
"/software/packages"=pkg_repl("lemon-sensor-linux","1.0.2-1","x86_64");
"/software/packages"=pkg_repl("lemon-sensor-parse-log","1.1.2-1","x86_64");

# Allow to add/override some packages based on OS version
include { if_exists('config/lemon/base') };
