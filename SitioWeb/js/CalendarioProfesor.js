

function Abrir(nodId, profId, fecha, puede) {
    //alert(nodId);
    //window.open('SegmentoProfe.aspx?NOD_ID=' + nodId + '&PROF_ID=' + profId + '&FECHA=' + fecha);
    //alert(puede);
    var link = 'SegmentoProfe.aspx?NOD_ID=' + nodId + '&PROF_ID=' + profId + '&FECHA=' + fecha + '&BLOQUEAR=0';
    if (puede == '1')
        window.location.href = link;
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
                    ActualizarCalendario(response.d, response.e, response.f);
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
                    ActualizarCalendario(response.d, response.e, response.f);
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

function ActualizarCalendario(mes, mensaje, anno) {
    //el mes viene con el año
    var arr = '';
    if (anno == undefined || anno == 0)
        arr = mes.split(',');
    var nodId = lblNodIdOculto.GetText();
    var profId = lblProfIdOculto.GetText();

    if (mensaje != '' && mensaje != undefined)
        alert(mensaje);

    var datos = mes + ',' + anno + '|' + nodId + '|' + profId;
    pnlPrincipal.PerformCallback(datos);
}