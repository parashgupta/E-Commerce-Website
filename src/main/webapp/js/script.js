//alert("Hello Parash");
function add_to_cart(p_id,p_name,p_price)
{
    let cart = localStorage.getItem("cart");
    if(cart==null)
    {
        //no cart yet
        let products=[];
        let product ={productId : p_id, productName : p_name, productQuantity:1, productPrice : p_price};
        products.push(product);
        
        localStorage.setItem("cart",JSON.stringify(products));
        console.log("product added first time");
        showToast("Item is added to cart");
    }
    else
    {
        //cart is already presenet
        let p_cart = JSON.parse(cart);
        let oldproduct = p_cart.find((item)=>item.productId==p_id);
        console.log(oldproduct);
        if(oldproduct)
        {
            //we have to increase the quantity
           oldproduct.productQuantity +=1;
           p_cart.map((item)=>
           {
               if(item.productId==oldproduct.productId)
               {
                   item.productQuantity = oldproduct.productQuantity;
               }
           })
        localStorage.setItem("cart",JSON.stringify(p_cart));
                console.log("product quantity increased");
                 showToast(oldproduct.productName + " Quantity is increased");
        }
        else
        {
            //we have to ad the product
        let product ={productId : p_id, productName : p_name, productQuantity:1, productPrice : p_price};
        p_cart.push(product);
        localStorage.setItem("cart",JSON.stringify(p_cart));
        console.log("product added");
        showToast("Item is added to cart");
        }
    }
    update_cart();
}

//Update Cart
function update_cart()
{
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    
    if(cart==null || cart.length==0)
    {
        console.log("cart is empty");
        $(".cart-items").html("0");
        $(".cart-body").html("<h3>Cart does not have any items</h3>");
        $(".checkout-btn").addClass('disabled');
    }
    else
    {
        //some items in the cart
        console.log(cart);
        $(".cart-items").html(`${cart.length}`);
        let table = `
        <table class='table'>
            <thead class = ''thead-light>
                <tr>
                    <th>Item Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total price</th>
                    <th>Action </th>
                </tr>
            </thead>
        `;
        
        let totalprice = 0;
        cart.map((item) =>{
            
            table+=
                    `
                    <tr>
                        <td>${item.productName}</td>
                        <td>${item.productPrice}</td>
                        <td>${item.productQuantity}</td>
                        <td>${item.productQuantity*item.productPrice}</td>
                        <td><button class='btn btn-danger btn-sm' onclick='deleteItemFromCart(${item.productId})'>remove</button></td>
                    <tr>
                    `
                   totalprice += item.productPrice*item.productQuantity;
        })
        
        table+= `<tr><th colspan='5' class='text-right'>Total Price : ${totalprice}</th></tr>
        </table>`;
        $(".cart-body").html(table);
        $(".checkout-btn").removeClass('disabled');
    }
}

//delete item from cart
function deleteItemFromCart(p_id)
{
    let cart = JSON.parse(localStorage.getItem('cart'));
   let newCart = cart.filter((item) => item.productId!=p_id);
   localStorage.setItem('cart',JSON.stringify(newCart))
   update_cart();
    showToast("Item is removed from cart");
}


//tost message
function showToast(content)
{
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(() =>
    {
        $("#toast").removeClass("display");
    }, 2000);
}


$(document).ready(function(){
    update_cart();
})


function goToCart()
{
    window.location = "checkout.jsp";
}



//Validation on Register page

function demo_name()
{
    let re = /^[A-Za-z\s]+$/;
    x = document.getElementById('name').value;
    if(re.test(x) || x.length===0)
    {
        document.getElementById('u_name').innerHTML='';
    }
    else
    {
        document.getElementById('u_name').innerHTML='invalid name';
        document.getElementById('u_name').style.color='red';
    }
}

function demo_phone()
{
    let re = /^[6-9]\d{9}$/;
    x = document.getElementById('phone').value;
    if(re.test(x) || x.length===0)
    {
        document.getElementById('u_phone').innerHTML='';
    }
    else
    {
        document.getElementById('u_phone').innerHTML='invalid mobile no.';
        document.getElementById('u_phone').style.color='red';
    }
}

function demo_email()
{
    let re = /^\w{3,30}\@gmail\.\w{3}$/;
    x = document.getElementById('email').value;
    if(re.test(x) || x.length===0)
    {
        document.getElementById('u_email').innerHTML='';
    }
    else
    {
        document.getElementById('u_email').innerHTML='invalid e-mail id';
        document.getElementById('u_email').style.color='red';
    }
}

function demo_pass()
{
    let re =/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@#$%^&+=!])(?!.*\s).{8,}$/;
    x = document.getElementById('password').value;
    if(re.test(x) || x.length===0)
    {
        document.getElementById('u_pass').innerHTML='';
    }
    else
    {
        document.getElementById('u_pass').innerHTML='password must be at least 8 characters and contains at least one uppercase,lowercase,number and symbols';
        document.getElementById('u_pass').style.color='red';
    }
}