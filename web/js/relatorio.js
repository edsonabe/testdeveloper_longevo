function valida_relatorio(){
	if(isNaN($('#numero_pedido').val())){
		alert('Por favor digite apenas números no campo "Número do pedido"');
		return false;
	}
}

$(document).ready( function () {
    var table = $('#table_relatorio').DataTable({
		"oLanguage": {
			"oPaginate": {
				"sFirst":    "«",
				"sPrevious": "‹",
				"sNext":     "›",
				"sLast":     "»"
			}
        },
		"sPaginationType": "four_button",
		"sPaginationType": "full_numbers",
		"pageLength": 5,
		"searching":   false,
		"lengthChange":   false,
        "ordering": false,
        "info":     false
	});
} );