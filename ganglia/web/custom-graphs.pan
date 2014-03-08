template monitoring/ganglia/web/custom-graphs;

variable GANGLIA_WEB_ROOT ?= "/var/www/html/ganglia";

variable GANGLIA_FRAME_DISKPOOL =<<EOF;
<?php

include_once( "mg-frame-dpm-diskpool-tcd.php");

$dpm_frame = new MGFrameDPM("dpm");

$dpm_frame->show_frame();

?>
EOF

"/software/components/filecopy/services" =
 npush(escape(GANGLIA_WEB_ROOT+"/templates/default/frames/tcd-diskpool.php"),
        nlist("config",GANGLIA_FRAME_DISKPOOL,
              "owner","root",
              "perms","0644"));

variable GANGLIA_FRAME_DISKPOOL_TCD =<<EOF;
<?php

/**
 *   Define the MGFrameDPM for producing a frame of DPM-specific
 *   graphs, tables and pie-charts.
 */

include_once("multiple-graphs.php");


/**
 *  Define the DPM graphs.
 */
class MGFrameDPM extends MGFrameBase
{

  function MGFrameDPM( $prefix) {
    /* parent constructor */
    $this->MGFrameBase( "DPM-related info", "efffee", "88aa88", $prefix);
  }


  /**
   *  Main entry point for generating frame content.
   */
  function frame_contents()
  {
    $this->graph_with_icons( "disk-graph.php?g=3");


    $this->graph_with_icons( "tcp-graph-stack.php?g=1");
    $this->graph_with_icons( "diskio-graph.php?g=util");
    $this->graph_with_icons( "diskio-graph.php?g=read");
    $this->graph_with_icons( "diskio-graph.php?g=write");
    $this->graph_with_icons( "diskio-graph.php?g=iowait");


  }

}

?>
EOF

"/software/components/filecopy/services" =
 npush(escape(GANGLIA_WEB_ROOT+"/mg-frame-dpm-diskpool-tcd.php"),
        nlist("config",GANGLIA_FRAME_DISKPOOL_TCD,
              "owner","root",
              "perms","0644"));

variable GANGLIA_DISKIO_GRAPH =<<EOF;
<?php

include_once "./multiple-graphs.php";
$graph = isset($_GET["g"]) ?
        escapeshellcmd( rawurldecode( $_GET["g"] )) : NULL;

/**
 *  Safety!  If end-user has somehow tricked PHP into creating a cmd
 *  before we have specified it, quit early.  Credit due to Peter
 *  Vreugdenhil <petervre@sci.kun.nl>
 */
if(isset($cmd)) {
  exit();
}


$rrdgraph = new MGRRDGraphBase();

   $cmd="";
   $pre_text="diskio";
   $post_text="util";

   $rrd_files = $rrdgraph->matching_rrds( $pre_text, $post_text);
   $ndisks=count($rrd_files);
   if ($ndisks == 0) {
      $ndisks=1;
   }
switch( $graph) {

 case "util":
   $cmd = $rrdgraph->cmd_start( "Disk utilisation",
                                "%", "0");

   $cmd .= $rrdgraph->build_series( $rrdgraph->colour,
                                    "diskio","util",  "",
                                    "", "",
                                    1);
   $cmd .= $rrdgraph->cmd_end();

   break;
 case "write":
   $cmd = $rrdgraph->cmd_start( "Disk write",
                                "kB/s", "0");
   $cmd .= $rrdgraph->build_series( $rrdgraph->colour,
                                    "diskio","write",  "",
                                    "", "",
                                    1);
   $cmd .= $rrdgraph->cmd_end();

   break;

 case "read":
   $cmd = $rrdgraph->cmd_start( "Disk read",
                                "kB/s", "0");
   $cmd .= $rrdgraph->build_series( $rrdgraph->colour,
                                    "diskio","read", "",
                                    "", "",
                                    1);
   $cmd .= $rrdgraph->cmd_end();

   break;

 case "iowait":
   $cmd = $rrdgraph->cmd_start( "Disk iowait",
                                "%", "0");
   $cmd .= $rrdgraph->build_series( $rrdgraph->colour,
                                    "diskio","iowait", "",
                                    "", "",
                                    1);
   $cmd .= $rrdgraph->cmd_end();

   break;

}


$rrdgraph->cmd_go( $cmd);

?>
EOF
"/software/components/filecopy/services" =
 npush(escape(GANGLIA_WEB_ROOT+"/diskio-graph.php"),
        nlist("config",GANGLIA_DISKIO_GRAPH,
              "owner","root",
              "perms","0644"));


variable GANGLIA_SPACE_TOKEN_GRAPH =<<EOF;
<?php

$period = isset($_GET["p"]) ?
        escapeshellcmd( rawurldecode( $_GET["p"] )) : NULL;
$size="medium";
echo "<html>\n<body>\n";
echo "<h1>Space token usage for the last $period</h1>";


$tokens=array('ATLASMCDISK','ATLASDATADISK','ATLASPRODDISK','ATLASSCRATCHDISK');

foreach ($tokens as $token) {
    echo "<img src=\"http://cagraidsvr23.cs.tcd.ie/ganglia/dpm-graph.php?g=3&c=SE_DISK&h=gridstore.cs.tcd.ie&r=$period&z=$size&tk=$token\">\n";
}
echo "</body>\n</html>";
?>
EOF

"/software/components/filecopy/services" =
 npush(escape(GANGLIA_WEB_ROOT+"/space-token-usage.php"),
        nlist("config",GANGLIA_SPACE_TOKEN_GRAPH,
              "owner","root",
              "perms","0644"));

