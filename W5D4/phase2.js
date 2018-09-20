function printCallback(array) {
  var result = array.forEach(name => {
      console.log(name);
  });
}

function titleize(array, callback) {
  var result = array.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  callback(result);
}

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
};

Elephant.prototype.grow = function() {
  this.height += 12;
};

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
};

Elephant.prototype.play = function() {
  var trick = this.tricks[Math.floor(Math.random()*this.tricks.length)];
  console.log(`${this.name} is ${trick}`);
};

Elephant.paradeHelper = function(elephant) {
  console.log(`${elephant.name} is trotting by!`);
}

function dinerBreakfast() {
  let order = "I'd like scrambled eggs and bacon please";
  console.log(order);

  return function(food) {
    order = `${order.slice(0, order.length - 7)} and ${food} please`;
    console.log(order);
  }
}
