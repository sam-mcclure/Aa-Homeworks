function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

function madLib(verb, adjective, noun) {
  var verb = verb.toUpperCase();
  var adjective = adjective.toUpperCase();
  var noun = noun.toUpperCase();
  console.log(`We shall ${verb} the ${adjective} ${noun}!`);
}

function isSubstring(searchString, subString) {
  console.log(searchString.includes(subString))
}

function fizzBuzz(array) {
  const result = [];
  array.forEach(num => {
    if !(num % 5 === 0 && num % 3 === 0) {
      if (num % 5 === 0 || num % 3 === 0) {
        result.push(num);
      }
    }
  });
  return result
}

function fizzBuzz(array) {
  const result = [];

  array.forEach(num => {
    if ((num % 3 === 0) ^ (num % 5 === 0)) {
      result.push(num);
    }
  });
  return result
}

function isPrime(number) {
  if (number < 2) return false;
  for (let i = 2; i < number; i++) {
    if (number % i === 0) {
      return false;
    }
  }
  return true;
}

function sumOfNPrimes(n) {
  let result = 0
  let numPrimes = 0;
  let i = 2;

  while (numPrimes < n) {
    if (isPrime(i)) {
      result += i;
      numPrimes++;
    }
    i++;
  }
  return result;
}

// mysteryScoping1();
// mysteryScoping2();
// mysteryScoping3();
// mysteryScoping4();
// mysteryScoping5();
