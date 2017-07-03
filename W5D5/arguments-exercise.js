function sum(...args) {
  let result = 0;
  for(let i = 0; i < args.length; i++) {
    result += args[i];
  }
  return result;
}

function sum2() {
  let result = 0;
  let argsArr = Array.from(arguments);
  for(let i = 0; i < argsArr.length; i++) {
    result += argsArr[i];
  }
  return result;
}

Function.prototype.myBind = function(ctx, ...bindArgs) {
  return (callArgs) => {
    return this.apply(ctx, bindArgs.concat(callArgs));
  };
};

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}
//
// const markov = new Cat("Markov");
// const breakfast = new Cat("Breakfast");
//
// let test1 = markov.says("meow", "Ned");
// console.log(test1);
// // Markov says meow to Ned!
// // true
//
// // bind time args are "meow" and "Kush", no call time args
// let test2 = markov.says.myBind(breakfast, "meow", "Kush")();
// console.log(test2);
// // Breakfast says meow to Kush!
// let test3 = markov.says.myBind(breakfast, "meow")("Markov");
// console.log(test3);

function curriedSum(numArgs) {
  let numbers = [];

  function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      let total = 0;
      numbers.forEach(function(el) {
        total += el;
      });

      return total;
    } else {
      return _curriedSum;
    }
  }

  return _curriedSum;
}

const a = curriedSum(4)(5)(30)(20)(1);
console.log(a);

Function.prototype.curry = function(numArgs) {
  let fn = this; //function
  let numbers = [];

  function _curriedFn(arg) {
    numbers.push(arg);

    if (numbers.length === numArgs) {
      return fn(...numbers); //return itself aka the function
    }
    else {
      return _curriedFn; //call original function
    }
  }
  return _curriedFn;
};

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}
let b = sumThree.curry(3)(4)(20)(6);
console.log(b);
