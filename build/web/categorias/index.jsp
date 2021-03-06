
<%@page import="java.util.ArrayList"%>
<%@page import="produtoDAO.categoria"%>
<%@page import="produtoDAO.tipo"%>
<
<!DOCTYPE html>


<%
categoria.loadingCategoria();
ArrayList <categoria> listaCategoria = categoria.getListaCategoria();

//tipo.loadingTipo();
//ArrayList <tipo> listaTipo = tipo.getListaTipo();


%>


<html>

    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Storage | Categorias</title>
        <link rel="stylesheet" type="text/css" href="categoria.css">
        <!-- Importa��o dos arquivos .js e .css -->
        <%@include file="../patterns/bibliotecas.jsp"%>       
    </head>
    <body onload="selecionarValor(this, 'idCategoriaAlterar', 'descricaoCategoriaAlterar', 'tipo');">
        
        <!-- IN�CIO do LAYOUT da tela de CATEGORIAS -->
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
        
            <!-- Importa��o do arquivo HEADER e MENU -->
            <%@include file="../patterns/header.jsp"%>
            
            <%@include file="../patterns/menu.jsp" %>
            
            <!-- In�cio do conte�do da tela de CATEGORIAS-->
            <main class="mdl-layout__content">
                <div class="mdl-grid"> 
                    <!-- Nome da p�gina e o Breadcrumbs (migalhas de p�o) -->
                    <div class="mdl-cell mdl-cell--12-col custom-box-page__title"><h4 class="title">Categorias</h4></div>
                    <div class="mdl-cell mdl-cell--12-col custom-box-breadcrumbs"><a class="custom-breadcrumbs">Categorias</a></div>
                </div>
                <div class="mdl-grid">
                    
                    <!-- Card de Categoria -->
                    <div class="custom-card-cliente__new mdl-card mdl-shadow--3dp mdl-cell--6-col">
                        <div class="mdl-card__title mdl-card--expand mdl-grid">       
                            <div class="mdl-cell--8-col custom-cliente-text__input">

                                
                                <!-- Select para selecionar a CATEGORIA -->
                                <div class="mdl-selectfield mdl-js-selectfield mdl-selectfield--floating-label" style="width:100%;">
                            
                                    <select id="categoria" class="mdl-selectfield__select" onchange="selecionarValorListarTipos(this, 'idCategoriaAlterar', 'descricaoCategoriaAlterar', 'tipo')">
                                        <option id="id-alterar-categoria" value="0">Selecione uma categoria...  </option>
                                        <%for(int i = 0; i < listaCategoria.size(); i++){%>
                                        <option id="id-alterar-categoria" value="<%=listaCategoria.get(i).getId_categoria()%>"><%=listaCategoria.get(i).getNome_categoria()%></option>
                                        <% System.out.println("categoria"+listaCategoria.get(i).getId_categoria());}%>
                                        
                                    </select>
                                    <label class="mdl-selectfield__label" for="categoria">Categoria</label>
                                </div>  
                                
                            </div>
                            
                            <div class="mdl-cell--4-col" style="padding-top: 15px;">
                                
                                <!-- Bot�o para alterar a categoria selecionada -->
                                <div style="position: relative; float: right;">
                                    <button id="botao-alterar-categoria" style="width:105px;"
                                            class=" mdl-button mdl-js-button mdl-button--raised mdl-button--primary mdl-js-ripple-effect" type="button"
                                            onclick="">
                                        Alterar
                                    </button>
                                </div>
                                
                            </div>

                            <div class="mdl-cell--8-col custom-cliente-text__input">
                                
                                <!-- Input para inserir o nome de uma nova categoria -->
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input" type="text" id="categoria-nome-new">
                                    <label class="mdl-textfield__label" for="categoria-nome-new"><div>Adicionar categoria</div></label>
                                </div>
                                
                            </div>
                            
                            <div class="mdl-cell--4-col" style="padding-top: 15px;">
                                
                                <!-- Bot�o para salvar e adicionar a nova categoria -->
                                <div style="position: relative; float: right;">
                                    <button class=" mdl-button mdl-js-button mdl-button--raised mdl-button--primary mdl-js-ripple-effect" type="button"
                                            onclick="cadastraCategoria('categoria-nome-new')">
                                        Adicionar
                                    </button>
                                </div>
                                
                            </div>
                        </div>
                    </div>

                    
                    <!-- Card de Tipo -->
                    <div class="custom-card-cliente__new mdl-card mdl-shadow--3dp mdl-cell--6-col">
                        <div class="mdl-card__title mdl-card--expand mdl-grid">       
                            <div class="mdl-cell--8-col custom-cliente-text__input">
                                
                                <!-- Select para selecionar o TIPO de acordo com a categoria selecionada -->
                                <div class="mdl-selectfield mdl-js-selectfield mdl-selectfield--floating-label" style="width:100%;">
                                    <select id="tipo" class="mdl-selectfield__select" onchange="selecionarTipoListarAtributos(this,'idTipoAlterar','atributoPorTipo','atributoPorTipo')">
                                            <option value="tipo-1">Selecione uma categoria...</option>
                                    </select>
                                    <label class="mdl-selectfield__label" for="tipo">Tipo do produto</label>
                                </div>  
                                
                            </div>
                            
                            <div class="mdl-cell--4-col" style="padding-top: 15px;">
                                
                                <!-- Bot�o para alterar o TIPO selecionado -->
                                <div style="position: relative; float: right;">
                                    <button id="botao-alterar-tipo" style="width:105px;" class=" mdl-button mdl-js-button mdl-button--raised mdl-button--primary mdl-js-ripple-effect" type="button">
                                        Alterar
                                    </button>
                                </div>
                                
                            </div>

                            <div class="mdl-cell--8-col custom-cliente-text__input">
                                
                                <!-- Input para inserir o nome de um novo TIPO -->
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input" type="text" id="tipoNomeNew">
                                    <label class="mdl-textfield__label" for="tipoNomeNew"><div>Adicionar tipo</div></label>
                                </div>
                                
                            </div>
                            
                            <div class="mdl-cell--4-col" style="padding-top: 15px;">
                                
                                <!-- Bot�o para salvar e adicionar o novo TIPO -->
                                <div style="position: relative; float: right;">
                                    <button class=" mdl-button mdl-js-button mdl-button--raised mdl-button--primary mdl-js-ripple-effect"
                                            type="button" onclick="cadastraTipo()">
                                        Adicionar
                                    </button>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    
                    <!-- Card de ATRIBUTOS -->
                    <div class="custom-card-cliente__new mdl-card mdl-shadow--3dp mdl-cell--12-col">
                        <div class="mdl-card__title mdl-card--expand mdl-grid">

                            <!-- Title do cadastro dos ATRIBUTOS para o tipo -->
                            <div class="mdl-cell--12-col">
                                <h5>Especifica��es do produto</h5>
                            </div>
                            
                            <!-- Input para inserir o nome de um novo ATRIBUTO -->
                            <div class="mdl-cell--4-col custom-cliente-text__input bor">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input" type="text" id="specsNomeNew">
                                    <label class="mdl-textfield__label" for="specsNomeNew"><div>Nome da especifica��o</div></label>
                                </div>
                            </div>
                            
                            <!-- Bot�o para adicionar o novo ATRIBUTO -->
                            <div class="mdl-cell-4-col">
                                <div style="padding-top: 15px;">
                                    <div style="position: relative; float: right;">
                                        <button class=" mdl-button mdl-js-button mdl-button--raised mdl-button--primary mdl-js-ripple-effect" 
                                                onclick="cadastraAtributo()" type="button">
                                            Adicionar
                                        </button>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Espa�amento pro layout -->
                            <div class="mdl-cell--4-col"></div>
                            
                            
                           <%// for(int i = 0; i < 3; i++){ %>
                           <div id="atributoPorTipo" class="mdl-cell--12-col">
                           <div class="custom-card-spec__new mdl-card mdl-shadow--3dp mdl-cell--12-col" style="min-height: 30px;">
                                
                                <div class="mdl-card__title mdl-card--expand mdl-grid">
                                    <!-- Input para mostrar o nome do ATRIBUTO -->
                                    
                                    <div class="mdl-cell--10-col mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" id="atributo" value="Atributo 1">
                                        <label class="mdl-textfield__label" for="atributo"><div>Nome atributo</div></label>
                                    </div>
                                    <!-- Bot�o para excluir o atributo -->
                                    <div class="mdl-cell--2-col custom-card-spec__close">
                                        <button class="mdl-button mdl-js-button mdl-button--icon mdl-button--primary">
                                            <i class="material-icons">close</i>
                                        </button>
                                    </div>
                                </div>
                                
                                
                            </div>
                               
                           </div>
                           <%//} %>
                        </div>
                    </div>
                
                    <!-- Modal para exibir o tipo selecionado-->
                    <div id="modal-altera-tipo" class="modal">
                        <div class="modal-content">
                            <div class="mdl-grid">
                                <div class="mdl-cell--8-col">
                                    <!-- Input para alterar o nome do Tipo-->
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" id="descricaoTipoAlterar" value="">
                                        <input class="mdl-textfield__input" type="hidden" id="idTipoAlterar" value="">
                                        <label class="mdl-textfield__label" for="cliente-dados-razao-social"><div id="cliente-tipo-campo-sobrenome">Nome categoria</div></label>
                                    </div>
                                </div>
                                
                                <!-- Bot�o para fechar a modal -->
                                <div class="mdl-layout-spacer mdl-cell--4-col">
                                    <span class="close">x</span>
                                </div>
                                
                                <!-- Espa�amento do layout -->
                                <div class="mdl-layout-spacer mdl-cell--4-col"></div>
                                
                                <!-- Bot�o para EXCLUIR o tipo-->
                                <div style="padding-top: 15px;" class="mdl-cell--4-col">
                                    <button class=" mdl-button mdl-js-button mdl-button--raised mdl-button--accent mdl-js-ripple-effect" type="button">
                                        Excluir
                                    </button>
                                </div>
                                   Salvar
                                    </button>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                    <!-- Modal para exibir a categoria selecionada-->
                    <div id="modal-altera-categoria" class="modal">
                        <div class="modal-content">
                            <div class="mdl-grid">
                                <div class="mdl-cell--8-col">
                                    <!-- Input para alterar o nome da CATEGORIA-->
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" id="descricaoCategoriaAlterar" value="">
                                        <input class="mdl-textfield__input" type="hidden" id="idCategoriaAlterar" value="">
                                        <label class="mdl-textfield__label" for="cliente-dados-razao-social"><div id="cliente-tipo-campo-sobrenome">Nome categoria</div></label>
                                    </div>
                                </div>
                                
                                <!-- Bot�o para fechar a modal -->
                                <div class="mdl-layout-spacer mdl-cell--4-col">
                                    <span class="close">x</span>
                                </div>
                                
                                <!-- Espa�amento do layout -->
                                <div class="mdl-layout-spacer mdl-cell--4-col"></div>
                                
                                <!-- Bot�o para EXCLUIR a categoria-->
                                <div style="padding-top: 15px;" class="mdl-cell--4-col">
                                    <button class=" mdl-button mdl-js-button mdl-button--raised mdl-button--accent mdl-js-ripple-effect" type="button">
                                        Excluir
                                    </button>
                                </div>
                                   Salvar
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>                       
                                <!-- Bot�o para SALVAR a categoria ou tipo -->
                                <div style="padding-top: 15px;" class="mdl-cell--4-col">
                                    <button class=" mdl-button mdl-js-button mdl-button--raised mdl-button--primary mdl-js-ripple-effect" type="button"
                                            onclick="alterarCategoria()">
                    
                </div>                                       
            </main>
            <!-- FIM do conte�do da tela de CADASTRO-->
            
        </div>
        <!-- FIM do LAYOUT da tela de CADASTRO -->
        
        <script>           
            // Get the modal
            var modal = document.getElementById('modal-altera-categoria');

            // Get the button that opens the modal
            var btn = document.getElementById("botao-alterar-categoria");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

            // When the user clicks on the button, open the modal 
            btn.onclick = function() {
                modal.style.display = "block";
            }

            // When the user clicks on <span> (x), close the modal
            span.onclick = function() {
                modal.style.display = "none";
            }

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        </script>
        <script>           
            // Get the modal
            var modal = document.getElementById('modal-altera-tipo');

            // Get the button that opens the modal
            var btn = document.getElementById("botao-alterar-tipo ");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

            // When the user clicks on the button, open the modal 
            btn.onclick = function() {
                modal.style.display = "block";
            }

            // When the user clicks on <span> (x), close the modal
            span.onclick = function() {
                modal.style.display = "none";
            }

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        </script>
        
    </body>      
</html>

