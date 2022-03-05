// $('.clothes').on('click', onClickshow);
// // $('#clothes').on('click',onClickshowto);

//  function onClickshow(){
//     // this.classList.toggle('clothes');
//     alert('ok')

//  }
// //  function onClickshowto(){
// //    elt.classList.toggle('d-none');

// //  }

$('.cat-btn').on('click', function(){
    
    let category = $(this).data('id');
    
    $('.allCat').addClass('d-none');
    $('#'+category).removeClass('d-none');
}); 


   
    $('#save').on('click', onClickSave);
  let carts = loadpanier('panier');
    function onClickSave() {
 
    
// Création d'un objet cart .
            const cart = {
                id: $('input[name=id]').val(),
                img: $('#prodImg').attr('src'),
                name: $('h6').text(),
                prix: $('strong').html(),
                quantity: $('#quantity').val(),
            }
       // id produit qui ajouter = id produit ds panier      
            let qt= carts.find(key=>key.id==cart.id);
         
            if(qt!=undefined){
                cart.quantity=parseInt( cart.quantity);
                qt.quantity=parseInt( qt.quantity);
                let index = carts.indexOf(qt);
                carts[index]['quantity']+=cart.quantity;
          

            }
            else{
                carts.push(cart);

            }
            saveStorage(carts, 'panier');
 
         
            // refreshpanier();
    }
    
      

    function loadpanier(panier) {
        var storage = JSON.parse(localStorage.getItem(panier));
        if (storage == null)
            storage = [];
        return storage
    }

    function saveStorage(data, panier) {
        var storage = JSON.stringify(data);
        localStorage.setItem(panier, storage);
    }
   



