#
#
#
template monitoring/lemon/sensor/Castor2Diskserver;

"/system/monitoring/sensor/Castor2Diskserver/cmdline"="/usr/bin/python /usr/libexec/sensors/mon_wrapper.py --PUT=01";

"/system/monitoring/sensor/Castor2Diskserver/class"=list(
nlist("name", "Castor2Diskserver.GetRmNodesState",
"descr","returns CASTOR2 diskserver rmnode status information",
"field",list(nlist("name","status","format","%124s"),
),
),

nlist("name", "Castor2Diskserver.GetSmsState",
"descr","returns CASTOR2 diskserver SMS status information",
"field",list(nlist("name","status","format","%124s"),
),
),

);
