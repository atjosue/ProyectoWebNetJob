$(document).ready(function () {
    var key="grafico1";
    var dato = 1;
    $.ajax({
        type: 'POST',
        async: false,
        dataType: 'json',
        data: {dato, key},
        url: "graficos",
        success: function (data)
        {
            var content = JSON.parse(data);
            var vaY=content[1];
          
           
            var chart = new CanvasJS.Chart("chartContainer", {
                title: {
                    text: "Producto mas Vendido"
                },
                data: [
                    {
                        // Change type to "doughnut", "line", "splineArea", etc.
                        type: "stackedColumn",
                        
                        dataPoints: [   
                            
                            {y: parseInt(vaY) , label: content[0]},

                        ]
                    }
                ]
            });
            chart.render();

        },
        error: function (xhr, status)
        {

        }
    });
    

});



