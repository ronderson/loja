<nav class="navbar navbar-expand-sm navbar-dark bg-dark fixed-top">
  <a class="navbar-brand" href="#">Sistema Loja</a>  
</nav>
<main role="main" >
    <div class="container"> 
        <div class="row">
            <div class="col-md-8 offset-md-2"> 
                <h1>Listar Usuario  </h1>
                <div class="text-right m-2">   
                    <div class="btn-group ">
                        <div class="dropdown mr-1">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Visualizar PDF
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                <a class="dropdown-item" href="<?php echo BASE_URL ?>home/gerarPdfPerfil" target="_blank">Usuarios por Perfil</a>
                                <a class="dropdown-item" href="<?php echo BASE_URL ?>home/gerarPdfAparelho" target="_blank">Usuarios por Aparelho</a>    
                            </div>
                        </div>
                        <div class="dropdown mr-1">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Exportar CSV
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                <a class="dropdown-item" href="<?php echo BASE_URL ?>home/gerarCsvPerfil" target="_blank">Usuarios por Perfil</a>
                                <a class="dropdown-item" href="<?php echo BASE_URL ?>home/gerarCsvAparelho" target="_blank">Usuarios por Aparelho</a>    
                            </div>
                        </div>
                        <div class="dropdown mr-1">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Exportar TXT
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                <a class="dropdown-item" href="<?php echo BASE_URL ?>home/gerarTxtPerfil" target="_blank">Usuarios por Perfil</a>
                                <a class="dropdown-item" href="<?php echo BASE_URL ?>home/gerarTxtAparelho" target="_blank">Usuarios por Aparelho</a>    
                            </div>
                        </div>
                        <a class="btn btn-success" href="<?php echo BASE_URL ?>home/cadastro">+ Usuario</a>
                    </div>       
                    <table class="table table-striped mt-3">
                        <thead>        
                            <tr>            
                                <th scope="col">Nome</th>
                                <th scope="col">Perfil</th>
                                <th scope="col" class="text-center">Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if (isset($usuarios) && !empty($usuarios)): ?>
                                <?php foreach ($usuarios as $user): ?>                                        
                                    <tr>            
                                        <td><?php echo $user['nome']; ?></td>
                                        <td><?php echo $user['perfil']; ?></td>
                                        <td align="center">                
                                            <a href="<?php echo BASE_URL ?>home/editCadastro/<?php echo $user['id'] ?>" class="btn btn-warning btn-sm">Editar</a>
                                            <button  onclick="del(<?php echo $user['id'];?>)" class="btn btn-danger btn-sm">Excluir</button>
                                        </td>
                                    </tr>                
                                <?php endforeach; ?>
                            <?php endif; ?>              
                        </tbody>
                    </table>
                </div>    
            </div>
        </div>
    </div>
</main>
<script>
    function del(id){
        
    swal({
        title: "Deseja Excluir este Usuario?",      
        icon: "warning",
         buttons: ["NÃO","SIM"],
        dangerMode: true,
        closeOnClickOutside: false,
        closeOnEsc: false,
      })
      .then((willDelete) => {        
        if (willDelete) {            
          swal("Usuario Excluido Com Sucesso", {
            icon: "success",            
          }).then(()=>{
            location.href="<?php echo BASE_URL?>home/delUsuario/"+ id;
          });          
        }        
      });
    }
</script>