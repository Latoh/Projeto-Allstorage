<%@page import="java.util.ArrayList"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Storage | Pedidos </title>
        <%@include file="../pattherns/bibliotecas.jsp"%>       
    </head>
    <body onload="writeCookie('sessionBox','false',3)">
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
        
            <%@include file="../pattherns/header.jsp"%>
            
            <%@include file="../pattherns/menu.jsp" %>
            
            <main class="mdl-layout__content">
                
                <div class="mdl-grid">
                    <div class="mdl-cell mdl-cell--12-col"><h4 class="title">Pedidos</h4></div>
                </div>
                
                <div class="mdl-grid">
                    <div class="mdl-cell mdl-cell--6-col">
                        <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent mdl-js-ripple-effect" id="addCliente" onclick="window.location('Cadastro.jsp')">
                            Novo Pedido
                        </button>
                    </div>
                    
                    <div class="mdl-tooltip mdl-tooltip--large" for="addCliente">Novo Pedido</div>
                    <div class="mdl-cell mdl-cell--6-col">
                        <button class="custom-button--small_icon mdl-button mdl-js-button mdl-js-ripple-effect" id="visibility" onclick="visualizacao('boxVisualizacao')">
                            <i class="material-icons">visibility</i>
                        </button>
                        <div class="mdl-tooltip mdl-tooltip--large" for="visibility">Visualização</div>
                        <button class="custom-button--small_icon mdl-button mdl-js-button mdl-js-ripple-effect" id="filter">
                            <i class="material-icons">filter_list</i>
                        </button>
                        <div class="mdl-tooltip mdl-tooltip--large" for="filter">Filtro</div>
                        <button class="custom-button--small_icon mdl-button mdl-js-button mdl-js-ripple-effect" id="export">
                            <i class="material-icons">cloud_download</i>
                        </button>
                        <div class="mdl-tooltip mdl-tooltip--large" for="export">Exportar</div>
                    </div>
                    
                    <span id="boxVisualizacao">
                    </span>
                    
                    <table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp mdl-cell--12-col">
                        <thead class="custom-table--head">
                            <tr>
                               
                                <th class="mdl-data-table__cell--non-numeric">Pedido</th>
                                <th class="mdl-data-table__cell--non-numeric">Cliente</th>
                                <th class="mdl-data-table__cell--non-numeric">Data Pedido</th>
                                <th class="mdl-data-table__cell--non-numeric">Data Devolução</th>
                                <th class="mdl-data-table__cell--non-numeric">Valor</th>
                               

                            </tr>
                        </thead>
                        
                        
                    </table>
                </div>
            </main>
            
            
            <div class="floting-action-button">
                <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" onclick="window.location('../cadastrar')">
                    <i class="material-icons">add</i>
                </button>
            </div>
            
        </div>
    </body>      
</html>

