$(document).ready(function () {
    console.log("ready!");
    $(document).foundation({
        accordion: {
            // specify the class used for accordion panels
            content_class: 'content',
            // specify the class used for active (or open) accordion panels
            active_class: 'active',
            // allow multiple accordion panels to be active at the same time
            multi_expand: true,
            // allow accordion panels to be closed by clicking on their headers
            // setting to false only closes accordion panels when another is opened
            toggleable: true
        }
    });
    $('#myAccordion').on('toggled', function (event, accordion) {
        console.log(accordion);
        var flecha = $('#flecha');
        if (accordion[0].className == 'content') {
            flecha.removeClass('fi-arrow-up');
            flecha.addClass('fi-arrow-down');
            //alert('flecha abajo');
        }
        else {
            flecha.removeClass('fi-arrow-down');
            flecha.addClass('fi-arrow-up');
            //alert('flecha arriba');
        }
    });
});

function Abrir(nodId, profId, fecha, puede) {

    //var link = 'SegmentoProfe.aspx?NOD_ID=' + nodId + '&PROF_ID=' + profId + '&FECHA=' + fecha + '&BLOQUEAR=0';
    //if (puede == '1')
    //    window.location.href = link;
    //abrir
    //grillaSegmentos.PerformCallback(fecha + '|' + nodId + '|' + profId + '|' + puede);
    if (puede == '1') {
        pnlCupos.PerformCallback(fecha + '|' + nodId + '|' + profId + '|' + puede);
        popupInfo.Show();
    }
    else
    {
        alert('El Profesor no tiene cupos disponibles para mostrar');
    }

}
function Mostrar(nodId, profId, fecha, puede) {
    //alert(nodId);
    //window.open('SegmentoProfe.aspx?NOD_ID=' + nodId + '&PROF_ID=' + profId + '&FECHA=' + fecha);
    //alert(puede);
    var link = 'SegmentoProfe.aspx?NOD_ID=' + nodId + '&PROF_ID=' + profId + '&FECHA=' + fecha + '&BLOQUEAR=1';
    window.location.href = link;
}
function HabilitarTodos(nodId, profId, fecha, puede) {
    var parametros = nodId + '|' + profId + '|' + fecha;
    var opcion = 'habilitar';
    if (puede == '1') {
        //alert('callback para habilitar todos los cupos');
        var answer = confirm("¿Está seguro de habilitar toda la agenda?")
        if (answer) {
            $.ajax({
                type: "POST",
                url: "CalendarioProfesor.ashx",
                data: { nodId: nodId, profId: profId, fecha: fecha, opcion: opcion },
                // DO NOT SET CONTENT TYPE to json
                // contentType: "application/json; charset=utf-8", 
                // DataType needs to stay, otherwise the response object
                // will be treated as a single string
                dataType: "json",
                success: function (response) {
                    //alert(response.d);
                    //realizar callback a la agenda
                    ActualizarCalendario(response.d);
                }
            });
        }
        else {
            return;
        }

    }
    else {
        alert('NO SE PUEDE HABILITAR LOS CUPOS.');
    }
}
function CancelarTodos(nodId, profId, fecha, puede) {
    var parametros = nodId + '|' + profId + '|' + fecha;
    var opcion = 'eliminar';
    if (puede == '1') {
        //alert('callback para habilitar todos los cupos');
        var answer = confirm("¿Está seguro de eliminar toda la agenda?")
        if (answer) {
            //alert('llamada ajax para eliminar toda la agenda.')
            $.ajax({
                type: "POST",
                url: "CalendarioProfesor.ashx",
                data: { nodId: nodId, profId: profId, fecha: fecha, opcion: opcion },
                // DO NOT SET CONTENT TYPE to json
                // contentType: "application/json; charset=utf-8", 
                // DataType needs to stay, otherwise the response object
                // will be treated as a single string
                dataType: "json",
                success: function (response) {
                    //alert(response.d);
                    //realizar callback a la agenda
                    ActualizarCalendario(response.d);
                }
            });
        }
        else {
            return;
        }

    }
    else {
        alert('NO SE PUEDE ELIMINAR LOS CUPOS.');
    }
}
function Bloquear(nodId, profId, fecha) {
    var mensaje = 'No se puede abrir este día';
    alert(mensaje);
}

function ActualizarCalendario(mes) {
    var nodId = lblNodIdOculto.GetText();
    var profId = lblProfIdOculto.GetText();
    var datos = mes + '|' + nodId + '|' + profId;
    pnlPrincipal.PerformCallback(datos);
}