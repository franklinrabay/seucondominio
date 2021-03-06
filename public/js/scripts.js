$(document).ready(function(){
    $('.navbar-collapse').collapse();
});

/*
 * @param string checkbox: id ou classe do checkbox da thead da tabela   
 * @param string div: id ou classe da div onde se encontra a tabela
 * @returns {undefined}
 */
function checkbox(checkbox, div) {
    $(checkbox).click(function(){
        var $table = $(div).find('table tbody input[type="checkbox"]');
        if ($(checkbox).prop("checked")){
            $table.each(function(){
                $(this).prop("checked", true);
            });
        }else{
            $table.each(function(){
                $(this).prop("checked", false);
            });
        }
    });
}

/*
 * @param string msg: uma mensagem caso não esteja nenhum checkbox marcado
 * @param string $parent: o DOM onde quer capturar se existe checkbox marcado 
 * @return boolean  
 */
function validarCheckbox(msg, $parent){
    var checked = $('input[type="radio"],input[type="checkbox"]').is(':checked');
    
    if ($parent) {
        checked = $parent.find('input[type="radio"],input[type="checkbox"]').is(':checked');
    } 
    
    if (!checked) {
        alert(msg);
        return false;
    }
    return true;
}

function mascara(o,f) {
    setTimeout(function(){
        o.value = f(o.value);
    }, 10);
}

function mvalor(v){
    v=v.replace(/\D/g,"");//Remove tudo o que não é dígito
    v=v.replace(/(\d)(\d{8})$/,"$1.$2");//coloca o ponto dos milhões
    v=v.replace(/(\d)(\d{5})$/,"$1.$2");//coloca o ponto dos milhares
    v=v.replace(/(\d)(\d{2})$/,"$1,$2");//coloca a virgula antes dos 2 últimos dígitos
    return v;
}

function leech(v){
    v=v.replace(/o/gi,"0");
    v=v.replace(/i/gi,"1");
    v=v.replace(/z/gi,"2");
    v=v.replace(/e/gi,"3");
    v=v.replace(/a/gi,"4");
    v=v.replace(/s/gi,"5");
    v=v.replace(/t/gi,"7");
    return v;
}

function inArray(needle, haystack) {
    var length = haystack.length;
    for(var i = 0; i < length; i++) {
        if(haystack[i] == needle) return true;
    }
    return false;
}

function soNumeros(v){
    return v.replace(/\D/g,"");
}

function telefone(v){
    v=v.replace(/\D/g,"");           //Remove tudo o que não é dígito
    v=v.replace(/^(\d\d)(\d)/g,"($1) $2"); //Coloca parênteses em volta dos dois primeiros dígitos
    v=v.replace(/(\d{4})(\d)/,"$1-$2");    //Coloca hífen entre o quarto e o quinto dígitos
    return v;
}

function fcpf(v){
    v=v.replace(/\D/g,"");                    //Remove tudo o que não é dígito
    v=v.replace(/(\d{3})(\d)/,"$1.$2");       //Coloca um ponto entre o terceiro e o quarto dígitos
    v=v.replace(/(\d{3})(\d)/,"$1.$2");       //Coloca um ponto entre o terceiro e o quarto dígitos
    //de novo (para o segundo bloco de números)
    v=v.replace(/(\d{3})(\d{1,2})$/,"$1-$2"); //Coloca um hífen entre o terceiro e o quarto dígitos
    return v;
}

function data(v){
    v=v.replace(/\D/g,"");
    v=v.replace(/(\d{2})(\d)/,"$1/$2");
    v=v.replace(/(\d{2})(\d)/,"$1/$2");
    return v;
}

function mesAno(v) {
    v=v.replace(/\D/g,"");
    v=v.replace(/(\d{2})(\d)/,"$1/$2");
    return v;
}

function fcep(v){
    v=v.replace(/\D/g,"");                //Remove tudo o que não é dígito
    v=v.replace(/^(\d{5})(\d)/,"$1-$2"); //Esse é tão fácil que não merece explicações
    return v;
}

function fcnpj(v){
    v=v.replace(/\D/g,"");                           //Remove tudo o que não é dígito
    v=v.replace(/^(\d{2})(\d)/,"$1.$2");             //Coloca ponto entre o segundo e o terceiro dígitos
    v=v.replace(/^(\d{2})\.(\d{3})(\d)/,"$1.$2.$3"); //Coloca ponto entre o quinto e o sexto dígitos
    v=v.replace(/\.(\d{3})(\d)/,".$1/$2");           //Coloca uma barra entre o oitavo e o nono dígitos
    v=v.replace(/(\d{4})(\d)/,"$1-$2");              //Coloca um hífen depois do bloco de quatro dígitos
    return v;
}

function fcpfcnpj(v){
    if (v.length < 15){
        return fcpf(v);
    } else {
        return fcnpj(v);
    }
}

function romanos(v){
    v=v.toUpperCase();             //Maiúsculas
    v=v.replace(/[^IVXLCDM]/g,""); //Remove tudo o que não for I, V, X, L, C, D ou M
    //Essa é complicada! Copiei daqui: http://www.diveintopython.org/refactoring/refactoring.html
    while(v.replace(/^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/,"")!="")
    v=v.replace(/.$/,"");
    return v;
}

function site(v){
    v=v.replace(/^http:\/\/?/,"");
    dominio=v;
    caminho="";
    if(v.indexOf("/")>-1)
    dominio=v.split("/")[0];
    caminho=v.replace(/[^\/]*/,"");
    dominio=dominio.replace(/[^\w\.\+-:@]/g,"");
    caminho=caminho.replace(/[^\w\d\+-@:\?&=%\(\)\.]/g,"");
    caminho=caminho.replace(/([\?&])=/,"$1");
    if(caminho!="")dominio=dominio.replace(/\.+$/,"");
    v="http://"+dominio+caminho;
    return v;
}

function hora(v){
    v=v.replace(/\D/g,"");                    //Remove tudo o que não é dígito
    v=v.replace(/(\d{2})(\d)/,"$1:$2");       //Coloca um ponto entre o segundo e o terceiro dígitos
    return v;
}

function maiusculo(v){
    v.value = v.value.toUpperCase();
}

function notas(v){
    v=v.replace(/\D/g,"");//Remove tudo o que não é dígito
    v=v.replace(/(\d)(\d{1})$/,"$1,$2");//coloca a virgula antes dos 2 últimos dígitos
    return v;
}
