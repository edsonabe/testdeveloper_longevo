<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;

/* use AppBundle\Entity\Chamados;
use AppBundle\Entity\Pedidos; */

class RelatorioController extends Controller
{
    /**
	 * @Route("/relatorio/", name="relatorio")
     */
    public function indexAction(Request $request)
    {
		$css = array ("relatorio.css", "jquery.dataTables.css");
		$js = array ("relatorio.js", "jquery.dataTables.js");
		
		$em = $this->getDoctrine()->getManager();
		
		$email = $request->request->get('email');
		$numero_pedido = $request->request->get('numero_pedido');
		
		if($email && $numero_pedido){
			$query = $em->createQuery(
							'SELECT c
							FROM AppBundle:Chamados c
							JOIN c.pedido p
							JOIN p.cliente cli
							WHERE cli.email LIKE :email
							AND	p.numero_pedido = :numero_pedido
							ORDER BY c.id DESC')
						->setParameter('email', '%'.$request->request->get('email').'%')
						->setParameter('numero_pedido', $request->request->get('numero_pedido'));
		}
		elseif($email){
			$query = $em->createQuery(
							'SELECT c
							FROM AppBundle:Chamados c
							JOIN c.pedido p
							JOIN p.cliente cli
							WHERE  cli.email LIKE :email
							ORDER BY c.id DESC')
						->setParameter('email', '%'.$request->request->get('email').'%');
		}
		elseif($numero_pedido){
			$query = $em->createQuery(
							'SELECT c
							FROM AppBundle:Chamados c
							JOIN c.pedido p
							WHERE  p.numero_pedido = :numero_pedido
							ORDER BY c.id DESC')
						->setParameter('numero_pedido', $request->request->get('numero_pedido'));
		}
		else{
			$query = $em->createQuery(
							'SELECT c
							FROM AppBundle:Chamados c
							ORDER BY c.id DESC');
		}
		$chamados = $query->getResult();
		
        // replace this example code with whatever you need
		return $this->render('default/relatorio.html.twig', array(
			'css' => $css,
			'js' => $js,
			'chamados' => $chamados
		));
    }
	
}
