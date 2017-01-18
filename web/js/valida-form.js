/**
 * Javascript
 *
 * @category   ToolsAndUtilities
 * @author     Edson Issao Abe <edson_abe@hotmail.com.br>
 * @version	   1.0.2
 * @paraments:
 * I -Para formatação do formulario utilizar:
 * 		1- Apos o campo cria a legenda;
 * 		2- Legenda dentro do campo;
 * 		3- Ambos acima;
 */

function validaCampo( campo, format )
	{
    $('#'+campo).removeClass('erro');
    if( $('#'+campo).val() == "" || $('#'+campo).val() == $('#'+campo).attr('title'))
    {
        $('#'+campo).focus();
				formataForm(campo, format);
        verifica = 1;
    }
}
function validaEmail( email, format ){
    $('#'+email).removeClass('erro');
    var mail = $('#'+email).val();
    var er = RegExp(/^[A-Za-z0-9_\-\.]+@[A-Za-z0-9_\-\.]{2,}\.[A-Za-z0-9]{2,}(\.[A-Za-z0-9])?/);
    if( mail == "" || $('#'+email).val() == $('#'+email).attr('title') )
    {
      $('#'+email).focus();
			formataForm(email, format);
      verifica = 1;
    }
   else if( er.test(mail) == false )
   {
    $('#'+email).focus();
		formataForm(email, format);
		verifica = 1;
   }
}
function validaSelect(campo , format){
	$('#'+campo).removeClass('erro');
    if( $('#'+campo).val() == "" )
    {
        $('#'+campo).focus();
		formataForm(campo, format);
		verifica = 1;
    }
}
function validaCheckbox(campo)
{
	$('#'+campo).next().removeClass('erro-checkbox');
    if( $('#'+campo).attr('checked') == null)
    {
        $('#'+campo).focus();
		$('#'+campo).next().addClass('erro-checkbox');
		verifica = 1;
    }
}
function validaRadio(campo)
{
	var boolValid = false;
	$('.'+campo).each(function() {
		if ( $(this).is(':checked') ) {
			boolValid = true;
		}
	});
	if(boolValid)
	{
		$('.'+campo).next().removeClass('erro-checkbox');
	}
	else
	{
		$('.'+campo).focus();
		$('.'+campo).next().addClass('erro-checkbox');
		verifica = 1;
	}
}
function formataForm(campo, format)
{
	$('#'+campo).addClass('erro');
	if(format == 1)
	{
		$('#'+campo).after('<div class="retorno">* Este campo é obrigatório</div>');
	}
	if(format == 2)
	{
		var legenda = $('#'+campo).attr('title');
		if($('#'+campo).val() ==  "")
		{
			$('#'+campo).attr('value', legenda);
		}
		$('#'+campo).focus(function(){
			if($('#'+campo).val() == $('#'+campo).attr('title'))
			{
				$('#'+campo).attr('value', '');
			}
		});
		$('#'+campo).click(function(){
			if($('#'+campo).val() == $('#'+campo).attr('title'))
			{
				$('#'+campo).attr('value', '');
			}
		});
		$('#'+campo).blur(function(){
			if($('#'+campo).val() == '')
			{
				$('#'+campo).attr('value', legenda);	
			}
		});
	}
	if(format == 3)
	{
		$('#'+campo).after('<div class="formError"><div class="formErrorContent">Este campo é obrigatório<br></div><div class="formErrorArrow"><div class="line10"><!-- --></div><div class="line9"><!-- --></div><div class="line8"><!-- --></div><div class="line7"><!-- --></div><div class="line6"><!-- --></div><div class="line5"><!-- --></div><div class="line4"><!-- --></div><div class="line3"><!-- --></div><div class="line2"><!-- --></div><div class="line1"><!-- --></div></div></div>');
		$('#'+campo).keypress(function(){
			$('#'+campo).next(".formError").remove();
			$('#'+campo).removeClass('erro');
		});
		
	}
}
function validaForm()
{
	if(verifica == 1)
	{
		return false;
	}
	else
	{
		return true;
	}
}