############################################################
#
# template monitoring/lemon/metric/default
#
############################################################

template monitoring/lemon/metric/default;

include { 'monitoring/lemon/metric/atd' };
include { 'monitoring/lemon/metric/crond' };
include { 'monitoring/lemon/metric/fmonagent' };
include { 'monitoring/lemon/metric/gridcert' };
include { 'monitoring/lemon/metric/hw' };
include { 'monitoring/lemon/metric/install' };
include { 'monitoring/lemon/metric/klogd' };
include { 'monitoring/lemon/metric/named' };
include { 'monitoring/lemon/metric/number_of_users' };
include { 'monitoring/lemon/metric/nscd' };
include { 'monitoring/lemon/metric/ntpd' };
include { 'monitoring/lemon/metric/os' };
include { 'monitoring/lemon/metric/quattor' };
include { 'monitoring/lemon/metric/security' };
include { 'monitoring/lemon/metric/sendmail' };
include { 'monitoring/lemon/metric/shared_memory' };
include { 'monitoring/lemon/metric/smartd' };
include { 'monitoring/lemon/metric/sshd' };
include { 'monitoring/lemon/metric/syslogd' };
include { 'monitoring/lemon/metric/system_state' };
include { 'monitoring/lemon/metric/xfs' };
include { 'monitoring/lemon/metric/xinetd' };
include { 'monitoring/lemon/metric/zombies' };
