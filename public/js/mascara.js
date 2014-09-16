$(document).ready(function(){
    $('.valor').keyup(function() {
        mascara(this,mvalor);
    });
    
    $('.cnpj').keyup(function() {
        mascara(this,fcnpj);
    });
    
    $('.telefone').keyup(function() {
        mascara(this,telefone);
    });
    
    maskQuantidade();
});

function maskQuantidade() {
    $('.quantidade').keyup(function() {
        mascara(this,soNumeros);
    });
}