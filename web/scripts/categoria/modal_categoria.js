/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
<script>           
    // Get the modal
    var modal = document.getElementById('modal-altera-categoria');
    // Get the button that opens the modal
    var btn = document.getElementById("botao-alterar-categoria");
    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];
    // When the user clicks on the button, open the modal 
    btn.onclick = function() {
        modal.style.display = "block"
    }
    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none"
    }
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none"
        } else {
        }
    };
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
        modal.style.display = "block"
    }
    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none"
    }
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none"
        }
    }
</script>


