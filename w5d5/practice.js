document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById("myCanvas");
  canvas.width = 500;
  canvas.length = 500;

  const ctx = canvas.getContext("2d");
  ctx.fillStyle = "blue";
  ctx.fillRect(0,0,500,500);

  ctx.beginPath();
  ctx.arc(100, 100, 30, 0, 2 * Math.PI);
  ctx.strokeStyle = "black";
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = "white";
  ctx.fill();
});
