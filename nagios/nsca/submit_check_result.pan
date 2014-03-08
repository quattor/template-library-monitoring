unique template monitoring/nagios/nsca/submit_check_result;

# create the script to submit check results to the master

variable SUBMIT_CHECK_RESULT = <<EOS;
#!/bin/sh

# Arguments:
#  $1 = host_name (Short name of host that the service is
#       associated with)
#  $2 = svc_description (Description of the service)
#  $3 = state_string (A string representing the status of
#       the given service - "OK", "WARNING", "CRITICAL"
#       or "UNKNOWN")
#  $4 = plugin_output (A text string that should be used
#       as the plugin output for the service checks)
#

# Convert the state string to the corresponding return code
return_code=-1

case "$3" in
    OK)
        return_code=0
        ;;
    WARNING)
        return_code=1
        ;;
    CRITICAL)
        return_code=2
        ;;
    UNKNOWN)
        return_code=3
        ;;
esac

# pipe the service check info into the send_nsca program, which
# in turn transmits the data to the nsca daemon on the central
# monitoring server

printf "%s\t%s\t%s\t%s\n" "$1" "$2" "$return_code" "$4" | \
EOS


variable SUBMIT_CHECK_RESULT = SUBMIT_CHECK_RESULT
                             + "/usr/sbin/send_nsca " + NAGIOS_MASTER
                             + " -c /etc/nagios/send_nsca.cfg"
                             + " -p " + to_string( NSCA_PORT ) +"\n";

include { 'components/filecopy/config' };
"/software/components/filecopy/services" = npush(
    escape("/usr/local/lib/nagios/plugins/eventhandlers/submit_check_result"),
    nlist("config",SUBMIT_CHECK_RESULT,
          "perms","0755")
);

