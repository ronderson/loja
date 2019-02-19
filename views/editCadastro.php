<nav class="navbar navbar-expand-sm navbar-dark bg-dark fixed-top">
  <a class="navbar-brand" href="#">Sistema Loja</a>  
</nav>
<main role="main" >
    <div class="container"> 
        <div class="row">
            <div class="col-md-8 offset-md-2">  
                <h1>Editar Usuario</h1><hr>
                <form method="POST" >
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="nome">Nome</label>
                            <input type="text" name="nome" class="form-control" id="nome" placeholder="Nome" required value="<?php echo $usuario['nome_usuario']; ?>">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="email">Email</label>
                            <input type="email" name="email" class="form-control" id="email" placeholder="Email" required value="<?php echo $usuario['email']; ?>">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="login">Login</label>
                            <input type="text" name="login" class="form-control" id="login" placeholder="Login" required value="<?php echo $usuario['login']; ?>">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="senha">Senha</label>
                            <input type="password" name="senha" class="form-control" id="senha" placeholder="senha" >
                        </div>          
                    </div>         
                    <div class="form-row">
                        <div class="form-group col-md-6">              
                            <label for="status">Status</label>
                            <select id="status"  name="status" class="form-control" required>
                                <option value="">escolhar um status</option>
                                <option value="1" <?php echo ($usuario['status_usuario'] == '1') ? 'selected ' : ''; ?>>Ativo</option>
                                <option value="0" <?php echo ($usuario['status_usuario'] == '0') ? 'selected ' : ''; ?>>Desativado</option>
                            </select>
                        </div> 
                        <div class="form-group col-md-6">              
                            <label for="perfil">Perfil</label>
                            <select id="status"  name="perfil" class="form-control" required>
                                <option value="">escolhar um Perfil</option>   
                                <?php foreach ($perfil as $per): ?>
                                    <option value="<?php echo $per['id_perfil'] ?>"   <?php echo ($usuario['id_perfil'] == $per['id_perfil']) ? 'selected ' : ''; ?> ><?php echo $per['nome_perfil'] ?></option>
                                <?php endforeach; ?>             

                            </select>
                        </div>            
                    </div>
                    <hr>
                    <button type="submit" class="btn btn-primary">Salva</button>
                    <a  href="<?php echo BASE_URL ?>" class="btn btn-secondary" >Cancelar</a> 
                </form>
            </div>    
        </div>
    </div>
</main> 
<?php if (isset($msg)): ?>
<script>
    swal({
    title: "Usuario Alterado com sucesso",    
    icon: "success"    
        })
    .then(()=>{
    location.href = "<?php echo BASE_URL;?>";
     }  
   );
</script>
<?php endif; ?>
