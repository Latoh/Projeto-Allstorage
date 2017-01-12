<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Storage</title>
        <link rel="shortcut icon" href="">
        <%@include file="patterns/bibliotecas.jsp"%>
        <style>
            .custom-layout-login{
                width: 20%;
                min-width: 180px;
                height: 220px;
                min-height: 200px;
                margin:auto;
                margin-top: 15%;
                padding: 20px;
                border: 1px solid rgb(0,150,136);
                border-radius: 8px;
            }
            
            .custom-box-title{
                margin:auto;
                text-align: center;
                margin-bottom: 30px;
                margin-top: 15px;
                font-size: 32px;
                color:rgb(0,150,136);
            }
            
            .custom-input-login{
                width: 90%;
                border:2px solid #ccc;
                padding: 5px;
                padding-left: 10px;
                margin-bottom: 10px;
            }
            
            .custom-input-login:focus{
                border: 2px solid #545454;
            }
            
            .botao-login{
                width: 97%;
                height: 30px;
                border: 0;
                background-color: rgb(0,150,136);
                color: #545454;
            }
            
            .botao-login:hover{
                background-color: #00bfa5;
                color:#ccc;
            }
            
            .custom-msg-login{
                color: red;
                font-size: 14px;
                float: right;
                margin-right: 10px;
                
            }
            
        </style>
    </head>
    <body>
        
            <main class="custom-layout-login">
                <div class="custom-box-login">
                    <div class="custom-box-title"><h4 class="custom-box-title">All Storage</h4></div>
                    <input type="text" name="login" id="login" class="custom-input-login" placeholder="Login" onblur="document.getElementById('msg-autentica').innerHTML = ''">
                    <br>
                    <input type="password" name="senha" id="senha" class="custom-input-login" placeholder="Senha">
                    <br>
                    <span id="msg-autentica" class="custom-msg-login"></span>
                    <button class="botao-login" name="botaoEntrar" id="botaoEntrar" onclick="autenticaUsuario('login','senha')">Entrar</button>
                </div>
            </main>

    </body>
</html>
            

