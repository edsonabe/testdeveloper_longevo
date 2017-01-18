<?php
namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="chamados")
 */
class Chamados
{
	/**
     * @ORM\Column(name="pk_chamado", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;
	
	/**
     * @ORM\ManyToOne(targetEntity="Pedidos", fetch="EAGER")
	 * @ORM\JoinColumn(name="fk_pedido", referencedColumnName="pk_pedido")
     */
    private $pedido;
	
	/**
     * @ORM\Column(name="titulo", type="string", length=255)
     */
    private $titulo;
	
	/**
     * @ORM\Column(name="observacao", type="text")
     */
    private $observacao;

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
     * Set titulo
     *
     * @param string $titulo
     *
     * @return Chamados
     */
    public function setTitulo($titulo)
    {
        $this->titulo = $titulo;

        return $this;
    }

    /**
     * Get titulo
     *
     * @return string
     */
    public function getTitulo()
    {
        return $this->titulo;
    }

    /**
     * Set observacao
     *
     * @param string $observacao
     *
     * @return Chamados
     */
    public function setObservacao($observacao)
    {
        $this->observacao = $observacao;

        return $this;
    }

    /**
     * Get observacao
     *
     * @return string
     */
    public function getObservacao()
    {
        return $this->observacao;
    }

    /**
     * Set pedido
     *
     * @param \AppBundle\Entity\Pedidos $pedido
     *
     * @return Chamados
     */
    public function setPedido(\AppBundle\Entity\Pedidos $pedido = null)
    {
        $this->pedido = $pedido;

        return $this;
    }

    /**
     * Get pedido
     *
     * @return \AppBundle\Entity\Pedidos
     */
    public function getPedido()
    {
        return $this->pedido;
    }
}
