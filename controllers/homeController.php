<?php

class homeController extends Controller{        
        
    public function index(){   
        $dados = array(); 
        $usuarios =  new Usuario();
        $dados['usuarios'] = $usuarios->getUsuarios();               
        $this->loadTemplate('listUsuarios',$dados);
    }    
    public function cadastro(){
        $dados = array();
        $usuario = new Usuario();
        $dados['perfil'] = $usuario->getPerfil(); 
        if(isset($_POST['nome']) && !empty($_POST['nome'])){
            $nome_usuario = addslashes($_POST['nome']);
            $email = addslashes($_POST['email']);
            $login = addslashes($_POST['login']);
            $senha = addslashes($_POST['senha']);
            $status_usuario = addslashes($_POST['status']);
            $perfil = addslashes($_POST['perfil']);
           if($usuario->addUsuario($nome_usuario,$email,$login,$senha,$status_usuario,$perfil)){               
            $dados['msg'] = 'add_ok';            
          }
        }
         $this->loadTemplate('addUsuario',$dados); 
    }
    public function editCadastro($id){
        $dados = array();       
        $usuario = new Usuario();
        $dados['usuario'] = $usuario->getUsuario($id);
        $dados['perfil'] = $usuario->getPerfil(); 
        if(isset($_POST['nome']) && !empty($_POST['nome'])){
            $nome_usuario = addslashes($_POST['nome']);
            $email = addslashes($_POST['email']);
            $login = addslashes($_POST['login']);
            $senha = addslashes($_POST['senha']);
            $status_usuario = addslashes($_POST['status']);
            $perfil = addslashes($_POST['perfil']);
            if($usuario->editUsuario($nome_usuario,$email,$login,$senha,$status_usuario,$perfil,$id)){               
                $dados['msg'] = 'edit_ok';                         
               }
        }
         $this->loadTemplate('editCadastro',$dados); 
    }
    public function delUsuario($id){
        $usuarios = new Usuario();
        if($usuarios->delUsuario($id)){
          header("Location: ".BASE_URL);
        }
    }
    public function gerarPdfPerfil(){
        require 'util/fpdf/fpdf.php';
        $pdf = new FPDF();
        $usuarios = new Usuario();
        $usuario = $usuarios->getUsuarios();
        $pdf->AddPage();
        $pdf->SetFont('Arial','B',16);
        $pdf->Cell(190,10,utf8_decode('Relatório de Usuarios'),0,0,"C");
        $pdf->Ln(15);

        $pdf->SetFont('Arial','I',10);
        $pdf->Cell(100,7,"Nome",1,0,"C");
        $pdf->Cell(60,7,"Perfil",1,0,"C");
        $pdf->Ln();

        foreach($usuario as $user):
            $pdf->Cell(100,7,utf8_decode($user['nome']),1,0,"C");
            $pdf->Cell(60,7,utf8_decode($user['perfil']),1,0,"C");
            $pdf->Ln();
        endforeach;       

        $pdf->Output();
    }
    public function gerarPdfAparelho(){
        require 'util/fpdf/fpdf.php';
        $usuarios = new Usuario();
        $usuario = $usuarios->getUsuarioAparelho(); 
        $pdf = new FPDF();              
        $pdf->AddPage();
        $pdf->SetFont('Arial','B',16);
        $pdf->Cell(190,10,utf8_decode('Relatório de Usuarios por Aparelho'),0,0,"C");
        $pdf->Ln(15);

        $pdf->SetFont('Arial','I',10);
        $pdf->Cell(100,7,"Nome",1,0,"C");
        $pdf->Cell(60,7,"Aparelho",1,0,"C");
        $pdf->Ln();      
        foreach($usuario as $user):
            $pdf->Cell(100,7,utf8_decode($user['nome']),1,0,"C");
            $pdf->Cell(60,7,utf8_decode($user['aparelho']),1,0,"C");
            $pdf->Ln();
        endforeach;       

        $pdf->Output();
    }
    public function gerarTxtPerfil(){               
        $usuarios = new Usuario();
        $usuario = $usuarios->getUsuarios(); 
        $conteudo = "Relatorio de Usuarios\n";                
        foreach($usuario as $user):
         $conteudo .= "Nome: ".$user['nome'].", Perfil: ". $user['perfil']."\n";            
        endforeach;
        $arquivo = "arquivo.txt";
        header ('Content-type: text/html; charset=utf-8');  
        header ("Content-type: text/x-txt");
        header ("Content-Disposition: attachment; filename={$arquivo}" );
        header ("Content-Description: PHP Generated Data" );
        echo $conteudo;
       }
    public function gerarTxtAparelho(){               
        $usuarios = new Usuario();
        $usuario = $usuarios->getUsuarioAparelho(); 
        $conteudo = "Relatorio de Usuarios por Aparelho\n";                
        foreach($usuario as $user):
        $conteudo .= "Nome: ".$user['nome'].", Aparelho: ". $user['aparelho']."\n";            
        endforeach;
        $arquivo = "arquivo.txt";
        header ('Content-type: text/html; charset=utf-8');  
        header ("Content-type: text/x-txt");
        header ("Content-Disposition: attachment; filename={$arquivo}" );
        header ("Content-Description: PHP Generated Data" );
        echo $conteudo;
    }
    public function gerarCsvAparelho(){        
		$usuarios = new Usuario();
        $usuario = $usuarios->getUsuarioAparelho(); 
        $conteudo = "nome,Aparelho\n";                
        foreach($usuario as $user):
         $conteudo .= $user['nome'].",". $user['aparelho']."\n";            
        endforeach;
        $arquivo = "arquivo.csv";        
        header ('Content-type: text/html; charset=utf-8');  
        header ("Content-type: text/x-csv");
        header ("Content-Disposition: attachment; filename={$arquivo}" );
        header ("Content-Description: PHP Generated Data" );
        echo $conteudo;
    }
    public function gerarCsvPerfil(){        
		$usuarios = new Usuario();
        $usuario = $usuarios->getUsuarios(); 
        $conteudo = "nome,perfil\n";                
        foreach($usuario as $user):
         $conteudo .= $user['nome'].",". $user['perfil']."\n";            
        endforeach;
        $arquivo = "arquivo.csv";        
        header ('Content-type: text/html; charset=utf-8');  
        header ("Content-type: text/x-csv");
        header ("Content-Disposition: attachment; filename={$arquivo}" );
        header ("Content-Description: PHP Generated Data" );
        echo $conteudo;
    }
   
}