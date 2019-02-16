<?php
class Usuario extends Model{
    
    public function __construct(){
        parent::__construct();        
        
    }    
    public function addUsuario($nome_usuario,$email,$login,$senha,$status_usuario,$perfil){
        $sql = "INSERT INTO usuarios(nome_usuario,email,login,senha,data_criacao,status_usuario) 
        VALUES(:nome_usuario,:email,:login,:senha,NOW(),:status_usuario)";
        $sql = $this->db->prepare($sql);        
        $sql->bindValue(':nome_usuario',$nome_usuario);
        $sql->bindValue(':email',$email);
        $sql->bindValue(':login',$login);
        $sql->bindValue(':senha',md5($senha));
        $sql->bindValue(':status_usuario',$status_usuario);       
        $sql->execute(); 
        $id_usuario = $this->db->lastInsertId();

        $sql01 = "INSERT INTO usuario_perfil(id_usuario,id_perfil) 
        VALUES(:id_usuario,:id_perfil)";
        $sql01 = $this->db->prepare($sql01);        
        $sql01->bindValue(':id_usuario',$id_usuario);
        $sql01->bindValue(':id_perfil',$perfil);
        $sql01->execute(); 
        
        return true;
    }
    public function editSenha($senha,$idUsuario){
        $sql = "UPDATE usuarios SET senha = '$senha' WHERE id_usuario = $idUsuario";
        $this->db->query($sql);
    }
    public function getPerfil(){
        $array = array();
        $sql = "SELECT * FROM perfil ORDER BY nome_perfil";
        $sql = $this->db->query($sql);
        if($sql->rowCount() > 0 ){
            $array = $sql->fetchAll();
        }        
        return $array;
    }
    public function getUsuarios(){
        $array = array();
        $sql = "SELECT usuarios.id_usuario as id, usuarios.nome_usuario as nome, perfil.nome_perfil as perfil
                FROM usuarios 
                INNER JOIN usuario_perfil ON(usuario_perfil.id_usuario = usuarios.id_usuario)
                INNER JOIN perfil ON(perfil.id_perfil = usuario_perfil.id_perfil) ORDER BY usuarios.nome_usuario";
        $sql = $this->db->query($sql);
        if($sql->rowCount() > 0 ){
            $array = $sql->fetchAll();
        }        
        return $array;
    }
    public function getUsuario($id){
        $array = array();
        $sql = "SELECT *, usuario_perfil.id_usuario as perfil FROM usuarios 
        INNER JOIN usuario_perfil ON (usuario_perfil.id_usuario = usuarios.id_usuario)
        WHERE usuarios.id_usuario = $id";
        $sql = $this->db->query($sql);
        if($sql->rowCount() > 0 ){
            $array = $sql->fetch();
        }        
        return $array;
    }
    public function getUsuarioAparelho(){
        $array = array();
        $sql = "SELECT usuarios.nome_usuario as nome, aparelhos.descricao_aparelho as aparelho FROM usuarios 
                INNER JOIN usuario_aparelhos ON (usuario_aparelhos.id_usuario = usuarios.id_usuario)
                INNER JOIN aparelhos ON (aparelhos.id_aparelho = usuario_aparelhos.id_aparelho) ORDER BY usuarios.nome_usuario";
        $sql = $this->db->query($sql);
        if($sql->rowCount() > 0 ){
            $array = $sql->fetchAll();
        }        
        return $array;
    }
    public function editUsuario($nome_usuario,$email,$login,$senha,$status_usuario,$perfil,$id){
        
        $sql = "UPDATE usuarios SET nome_usuario = :nome_usuario, login = :login, email = :email, senha = :senha, 
        status_usuario = :status_usuario WHERE id_usuario = :id";
        
        $sql = $this->db->prepare($sql);        
        $sql->bindValue(':nome_usuario',$nome_usuario);
        $sql->bindValue(':email',$email);
        $sql->bindValue(':login',$login);
        $sql->bindValue(':senha',md5($senha));
        $sql->bindValue(':status_usuario',$status_usuario);
        $sql->bindValue(':id',$id);       
        $sql->execute(); 
        $id_usuario = $id;

        $sql01 = "UPDATE usuario_perfil SET id_perfil = :id_perfil WHERE id_usuario = :id_usuario";
        $sql01 = $this->db->prepare($sql01);        
        $sql01->bindValue(':id_usuario',$id_usuario);
        $sql01->bindValue(':id_perfil',$perfil);
        $sql01->execute(); 
        return true;
    }
    public function delUsuario($id){        
       $sql = "DELETE FROM usuarios WHERE id_usuario = $id";
       $this->db->query($sql);       
       return true;
    }



}