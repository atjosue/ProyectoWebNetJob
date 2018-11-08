$(document).ready(function () {
    var dato = 1;
    var key="empresa";
    $.ajax({
        type: 'POST',
        async: false,
        dataType: 'json',
        data: {dato,key},
        url: "../../grafico",
        success: function (data)
        {
           

            var con = JSON.parse(data);
            console.log(con);
              var chart = new CanvasJS.Chart("chartContainer", {
                title: {
                    text: "Postulantes ultimos 5 dias"
                },
                data: [
                    {
                        // Change type to"stackedColumn" "doughnut", "line", "splineArea", etc.
                        type: "line",

                        dataPoints: [

                            {y: parseInt(con[0].total), label: con[0].fecha},
                            {y: parseInt(con[1].total), label: con[1].fecha},
                            {y: parseInt(con[2].total), label: con[2].fecha},
                            {y: parseInt(con[3].total), label: con[3].fecha},
                            {y: parseInt(con[4].total), label: con[4].fecha}
                            
                        ]
                    }
                ]
            });
           



        },
        error: function (xhr, status)
        {

        }
    });
});



