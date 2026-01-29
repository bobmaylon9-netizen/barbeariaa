<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<title>Barbershop — Experiência Premium</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>
:root{
  --gold:#c8a45d;
  --dark:#0d0d0d;
  --gray:#b5b5b5;
}
*{margin:0;padding:0;box-sizing:border-box}
body{
  font-family:'Poppins',sans-serif;
  background:var(--dark);
  color:#fff;
  scroll-behavior:smooth;
}
a{text-decoration:none;color:inherit}
section{padding:100px 8%}

.hero{
  height:100vh;
  background:url('https://images.unsplash.com/photo-1599351431202-1e0f0137899a') center/cover no-repeat;
  position:relative;
  display:flex;
  align-items:center;
}
.hero::after{
  content:"";
  position:absolute;inset:0;
  background:rgba(0,0,0,.75);
}
.hero-content{
  position:relative;
  max-width:650px;
  animation:fadeUp 1.2s ease;
}
.hero h1{
  font-family:'Playfair Display',serif;
  font-size:60px;
  line-height:1.1;
}
.hero h1 span{color:var(--gold)}
.hero p{
  margin:25px 0;
  color:var(--gray);
  font-size:18px;
}
.btn{
  display:inline-block;
  padding:14px 36px;
  border-radius:50px;
  background:var(--gold);
  color:#000;
  font-weight:600;
}

.services,.gallery,.testimonials,.pricing,.booking{
  background:#111;
}
h2{
  font-family:'Playfair Display',serif;
  font-size:42px;
  margin-bottom:50px;
  text-align:center;
}
.grid{
  display:grid;
  grid-template-columns:repeat(auto-fit,minmax(260px,1fr));
  gap:30px;
}
.card{
  background:#181818;
  padding:30px;
  border-radius:20px;
  transition:.3s;
}
.card:hover{transform:translateY(-10px)}
.card h3{margin-bottom:10px;color:var(--gold)}
.price{font-size:22px;font-weight:600;margin:15px 0}
.add{
  background:transparent;
  border:1px solid var(--gold);
  color:var(--gold);
  padding:10px 20px;
  border-radius:30px;
  cursor:pointer;
}

.gallery img{
  width:100%;
  border-radius:20px;
}

.testimonial{
  font-style:italic;
  color:#ddd;
}

.booking form{
  max-width:600px;
  margin:auto;
  display:grid;
  gap:20px;
}
input,select{
  padding:15px;
  border-radius:12px;
  border:none;
}

footer{
  background:#000;
  padding:40px;
  text-align:center;
  color:#777;
}

/* FLOAT BUTTONS */
.whatsapp,.cart{
  position:fixed;
  right:20px;
  width:60px;
  height:60px;
  border-radius:50%;
  display:flex;
  align-items:center;
  justify-content:center;
  font-size:26px;
  z-index:999;
}
.whatsapp{
  bottom:20px;
  background:#25D366;
}
.cart{
  bottom:90px;
  background:var(--gold);
  color:#000;
}

/* CART MODAL */
#cartBox{
  position:fixed;
  inset:0;
  background:rgba(0,0,0,.8);
  display:none;
  align-items:center;
  justify-content:center;
}
#cartBox div{
  background:#111;
  padding:30px;
  border-radius:20px;
  width:90%;
  max-width:400px;
}

@keyframes fadeUp{
  from{opacity:0;transform:translateY(40px)}
  to{opacity:1;transform:translateY(0)}
}
</style>
</head>

<body>

<!-- HERO -->
<section class="hero">
  <div class="hero-content">
    <h1>Mais que um corte.<br><span>Uma experiência Barbershop.</span></h1>
    <p>Agende, escolha seu estilo e viva o padrão premium que transforma sua imagem.</p>
    <a href="#booking" class="btn">Agendar Agora</a>
  </div>
</section>

<!-- SERVICES -->
<section class="services" id="services">
<h2>Serviços Premium</h2>
<div class="grid">
  <div class="card"><h3>Corte Clássico</h3><p class="price">R$ 60</p><button class="add" onclick="add('Corte Clássico')">Adicionar</button></div>
  <div class="card"><h3>Fade + Barba</h3><p class="price">R$ 90</p><button class="add" onclick="add('Fade + Barba')">Adicionar</button></div>
  <div class="card"><h3>Barba Completa</h3><p class="price">R$ 50</p><button class="add" onclick="add('Barba Completa')">Adicionar</button></div>
  <div class="card"><h3>Platinado</h3><p class="price">R$ 180</p><button class="add" onclick="add('Platinado')">Adicionar</button></div>
  <div class="card"><h3>Luzes</h3><p class="price">R$ 150</p><button class="add" onclick="add('Luzes')">Adicionar</button></div>
  <div class="card"><h3>Hidratação Premium</h3><p class="price">R$ 70</p><button class="add" onclick="add('Hidratação Premium')">Adicionar</button></div>
</div>
</section>

<!-- GALLERY -->
<section class="gallery">
<h2>Galeria</h2>
<div class="grid">
<img src="https://images.unsplash.com/photo-1621605810052-809c7f1d9b6b">
<img src="https://images.unsplash.com/photo-1622288432450-277d0f9d66fd">
<img src="https://images.unsplash.com/photo-1592647420148-bfcc177e2117">
</div>
</section>

<!-- TESTIMONIALS -->
<section class="testimonials">
<h2>Depoimentos</h2>
<div class="grid">
  <div class="card testimonial">“Nunca vi uma barbearia nesse nível. Experiência absurda.”</div>
  <div class="card testimonial">“Organização, estilo e atendimento premium.”</div>
  <div class="card testimonial">“Depois que fiz o site, minha agenda lotou.”</div>
</div>
</section>

<!-- BOOKING -->
<section class="booking" id="booking">
<h2>Agendamento</h2>
<form onsubmit="send(event)">
<input id="name" placeholder="Seu nome" required>
<input id="date" type="date" required>
<input id="time" type="time" required>
<button class="btn">Confirmar no WhatsApp</button>
</form>
</section>

<footer>
© Barbershop — Site demonstrativo premium
</footer>

<!-- FLOAT -->
<a class="whatsapp" href="https://wa.me/message/GFJ7SFMFDNSGG1" target="_blank">💬</a>
<div class="cart" onclick="openCart()">🛒</div>

<!-- CART -->
<div id="cartBox">
  <div>
    <h3>Serviços Selecionados</h3>
    <ul id="list"></ul>
    <br>
    <button class="btn" onclick="send()">Enviar Pedido</button>
  </div>
</div>

<script>
let items=[];

function add(item){
  items.push(item);
  alert(item+" adicionado!");
}
function openCart(){
  document.getElementById('cartBox').style.display='flex';
  document.getElementById('list').innerHTML=items.map(i=>"<li>"+i+"</li>").join("");
}
function send(e){
  if(e) e.preventDefault();
  let name=document.getElementById('name')?.value||'Cliente';
  let date=document.getElementById('date')?.value||'';
  let time=document.getElementById('time')?.value||'';
  let msg=`Olá, me chamo ${name}. Quero agendar:\nServiços: ${items.join(', ')}\nData: ${date} Hora: ${time}`;
  window.open("https://wa.me/message/GFJ7SFMFDNSGG1?text="+encodeURIComponent(msg));
}
</script>

</body>
</html>
