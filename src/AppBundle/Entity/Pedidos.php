<?php
namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="pedidos")
 */
class Pedidos
{
	/**
     * @ORM\Column(name="pk_pedido", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;
	
	/**
	 * @ORM\ManyToOne(targetEntity="Clientes", fetch="EAGER")
	 * @ORM\JoinColumn(name="fk_cliente", referencedColumnName="pk_cliente")
     */
    private $cliente;
	
	/**
     * @ORM\Column(type="integer")
     */
    private $numero_pedido;


    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set numeroPedido
     *
     * @param integer $numeroPedido
     *
     * @return Pedidos
     */
    public function setNumeroPedido($numeroPedido)
    {
        $this->numero_pedido = $numeroPedido;

        return $this;
    }

    /**
     * Get numeroPedido
     *
     * @return integer
     */
    public function getNumeroPedido()
    {
        return $this->numero_pedido;
    }

    /**
     * Set cliente
     *
     * @param \AppBundle\Entity\Clientes $cliente
     *
     * @return Pedidos
     */
    public function setCliente(\AppBundle\Entity\Clientes $cliente = null)
    {
        $this->cliente = $cliente;

        return $this;
    }

    /**
     * Get cliente
     *
     * @return \AppBundle\Entity\Clientes
     */
    public function getCliente()
    {
        return $this->cliente;
    }
}
