#
# Generic NSCA configuration (for passive Nagios service checks)
# If needed, this template includes
#   - the send configuration (for clients)
#   - the daemon configuration (for Nagios servers receiving passive check results)
#   - the results submission configuration (for active Nagios servers to send their
#     results to the Nagios master server)
#
template monitoring/nagios/nsca/config;

# include optional NSCA send (client) configuration
variable NSCA_SEND_TEMPLATE ?= null;
include { NSCA_SEND_TEMPLATE };

# include optional slave server configuration
# to forward check results to master
variable NSCA_SUBMIT_RESULT_TEMPLATE ?= null;
include { NSCA_SUBMIT_RESULT_TEMPLATE };

# include optional NSCA daemon configuration
variable NSCA_DAEMON_TEMPLATE ?= null;
include { NSCA_DAEMON_TEMPLATE };
