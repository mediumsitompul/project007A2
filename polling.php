<?php
include "conn3.php";

//For Real Apps
  $opsys = $_REQUEST['opsys'];

//For Testing
//$opsys ="OS.linux";

    $result = mysqli_query($connect,
	"insert into t_polling
    set polling='$opsys'
	"
    );

    if($result){
        echo json_encode([
            'message' => 'Data input successfully1'
        ]);
    }else{
        echo json_encode([
            'message' => ''
        ]);
    }
	?>
