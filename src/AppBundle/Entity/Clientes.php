<?php
namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="clientes")
 */
class Clientes
{
	/**
     * @ORM\Id
	 * @ORM\Column(type="integer", name="pk_cliente")
     * @ORM\GeneratedValue
     */
    private $id;
	
	/**
	 * @ORM\OneToMany(targetEntity="Pedidos", mappedBy="pk_pedidos", cascade={"all"}, fetch="LAZY")
	*/
	private $pedidos;
	
	/**
     * @ORM\Column(name="nome", type="string", length=100)
     */
    private $nome;
	
	/**
     * @ORM\Column(name="email", type="string", length=100)
     */
    private $email;
    
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->pedidos = new \Doctrine\Common\Collections\ArrayCollection();
    }

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
     * Set nome
     *
     * @param string $nome
     *
     * @return Clientes
     */
    public function setNome($nome)
    {
        $this->nome = $nome;

        return $this;
    }

    /**
     * Get nome
     *
     * @return string
     */
    public function getNome()
    {
        return $this->nome;
    }

    /**
     * Set email
     *
     * @param string $email
     *
     * @return Clientes
     */
    public function setEmail($email)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Get email
     *
     * @return string
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * Add pedido
     *
     * @param \AppBundle\Entity\Pedidos $pedido
     *
     * @return Clientes
     */
    public function addPedido(\AppBundle\Entity\Pedidos $pedido)
    {
        $this->pedidos[] = $pedido;

        return $this;
    }

    /**
     * Remove pedido
     *
     * @param \AppBundle\Entity\Pedidos $pedido
     */
    public function removePedido(\AppBundle\Entity\Pedidos $pedido)
    {
        $this->pedidos->removeElement($pedido);
    }

    /**
     * Get pedidos
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getPedidos()
    {
        return $this->pedidos;
    }
}
