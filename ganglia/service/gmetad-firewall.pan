unique template monitoring/ganglia/service/gmetad-firewall;

include { 'components/iptables/config' };

'/software/components/iptables/filter/rules' = {
    append(nlist(
        'command', '-A',
        'chain', 'INPUT',
        'protocol', 'tcp',
        'match', 'tcp',
        'dst_port', GANGLIA_GMETAD_XPORT,
        'target', 'ACCEPT'
    ));
    append(nlist(
        'command', '-A',
        'chain', 'INPUT',
        'protocol', 'tcp',
        'match', 'tcp',
        'dst_port', GANGLIA_GMETAD_IPORT,
        'target', 'ACCEPT'
    ));
};

