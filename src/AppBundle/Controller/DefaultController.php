<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;

use AppBundle\Entity\Clientes;
use AppBundle\Entity\Chamados;
use AppBundle\Entity\Pedidos;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
		$css = array ("index.css", "valida-form/form-valida.css");
		$js = array ("index.js", "valida-form.js");
		
		return $this->render('default/index.html.twig', array(
			'css' => $css,
			'js' => $js
		));
    }
	
	 /**
     * @Route("/cadastraChamado", name="cadastraChamado")
     */
    public function cadastraChamado(Request $request)
    {
		if (!$request->isXmlHttpRequest()) {
			return new JsonResponse(array('message' => 'You can access this only using Ajax!'), 400);
		}
		
		$em = $this->getDoctrine()->getManager();
		$query = $em->createQuery(
						'SELECT count(p.id)
						FROM AppBundle:Pedidos p
						WHERE p.numero_pedido = :numeropedido'
					)->setParameter('numeropedido', $request->request->get('numero_pedido'));
		$qtd_pedido = $query->getSingleScalarResult();
		
		if($qtd_pedido >= 1) {
			return new JsonResponse('O número do pedido já existe, por favor confira e tente novamente', 400);
		}
		else{
			$em = $this->getDoctrine()->getManager();
			$query = $em->createQuery(
							'SELECT c
							FROM AppBundle:Clientes c
							WHERE c.email = :email'
						)->setParameter('email', $request->request->get('email'));
			$cliente = $query->setMaxResults(1)->getOneOrNullResult();
			
			if(!$cliente){
				$cliente = new Clientes();
				$cliente->setNome($request->request->get('nome'));
				$cliente->setEmail($request->request->get('email'));
				
				$em->persist($cliente);
			}
			
			$pedido = new Pedidos();
			$pedido->setCliente($cliente);
			$pedido->setNumeroPedido($request->request->get('numero_pedido'));
			
			$em->persist($pedido);
			
			$chamado = new Chamados();
			$chamado->setPedido($pedido);
			$chamado->setTitulo($request->request->get('titulo'));
			$chamado->setObservacao($request->request->get('observacao'));
			
			$em->persist($chamado);
			
			$em->flush();
			
			return new JsonResponse('Chamado cadastrado com sucesso', 200); 
		}
    }
}
