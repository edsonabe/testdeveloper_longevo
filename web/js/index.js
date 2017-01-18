function valida_chamado(){
	verifica = 0;
	//validaCampo('input_security_code');
	validaCampo('observacao');
	validaCampo('titulo');
	validaEmail('email');
	validaCampo('numero_pedido');
	validaCampo('nome');
	if (validaForm()){
		$('.status').removeClass('hidden');
		$('.status').addClass('alert-info');
		$('.status').html("Enviando, aguarde");
		
		$.ajax({
			url: "/cadastraChamado",
			method: "POST",
			data: $('#form_chamado').serialize()
		})
		.done(function(data) {
			$('.status').removeClass('alert-info');
			$('.status').removeClass('alert-danger');
			$('.status').addClass('alert-success');
			$('.status').html(data);
			$('#form_chamado')[0].reset();
		})
		.fail(function(data) {
			message = data.responseJSON;
			message = message.replace('"','');
			$('.status').removeClass('alert-info');
			$('.status').removeClass('alert-success');
			$('.status').addClass('alert-danger');
			$('.status').html(message);
		});

	}
}