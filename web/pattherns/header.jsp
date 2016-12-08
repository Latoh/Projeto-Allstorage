<header class="mdl-layout__header">
    <div class="mdl-layout__header-row">
        <!-- Title -->
        <span class="mdl-layout-title"><a class="custom-header-title" href="http://localhost:8080/allStorage/">All Storage</a></span>              
        <!-- Add spacer, to align navigation to the right -->
        <div class="mdl-layout-spacer"></div>

        <!-- Navigation. We hide it in small screens. -->
        <nav class="mdl-navigation mdl-layout--large-screen-only">                
            
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
              <label class="mdl-button mdl-js-button mdl-button--icon" for="searchInput">
                <i class="material-icons">search</i>
              </label>
              <div class="mdl-textfield__expandable-holder">
                <input class="mdl-textfield__input" type="text" id="searchInput">
                <label class="mdl-textfield__label" for="searchInput">Pesquisar...</label>
              </div>
            </div>
            
            <a class="mdl-navigation__link" href="">
                <div class="material-icons mdl-badge mdl-badge--overlap" data-badge="3">notifications</div>
            </a>

            <button id="config" class="mdl-button mdl-js-button mdl-button--icon">
                <i class="material-icons">settings</i>
            </button>

            <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="config">
                <li class="mdl-menu__item">Minhas preferências</li>
                <li class="mdl-menu__item">Configurações da conta</li>
                <li class="mdl-menu__item" onclick="window.location('http://localhost:8080/allStorage/login.jsp')">Sair</li>
            </ul>
        </nav>
    </div>
</header>