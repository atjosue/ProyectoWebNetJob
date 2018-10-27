$(document).ready(function () {

        $.ajax({
            url: 'procesarRepor',
            success: function (data) {
                var content = JSON.parse(data);
                $('#NumUsuarios').append(content[0]);
                $('#NumVentas').append(content[1]);
                $('#NumProducto').append(content[2]);
                $('#NumClientes').append(content[3]);

            }
        });
    
});





