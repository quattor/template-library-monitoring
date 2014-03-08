unique template monitoring/ganglia/service/gmond-firewall;

include { 'components/iptables/config' };

'/software/components/iptables/filter/rules' = {
    append(nlist(
        'command', '-A',
        'chain', 'INPUT',
        'protocol', 'tcp',
        'match', 'tcp',
        'dst_port', GANGLIA_GMOND_PORT,
        'target', 'ACCEPT'
    ));
    append(nlist(
        'command', '-A',
        'chain', 'INPUT',
        'protocol', 'udp',
        'match', 'udp',
        'dst_port', GANGLIA_GMOND_PORT,
        'target', 'ACCEPT'
    ));
};
