document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas');
  canvas.height = 500;
  canvas.width = 500;
  const ctx = canvas.getContext('2d');

  ctx.fillStyle = ('blue');
  ctx.fillRect(10, 10, 200, 100);

  ctx.beginPath();
  ctx.arc(75, 75, 50, 0, 2 * Math.PI );
  ctx.strokeStyle = 'black';
  ctx.lineWidth = 2;
  ctx.stroke();
  ctx.fillStyle = 'green';
  ctx.fill();

  ctx.beginPath();
  ctx.moveTo(75, 50);
  ctx.lineTo(100, 75);
  ctx.lineTo(100, 25);
  ctx.fillStyle = 'purple';
  ctx.fill();
});
