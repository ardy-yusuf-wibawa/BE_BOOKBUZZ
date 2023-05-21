let orderNumber = 0;

exports.incrementOrderNumber = () => {
  const today = new Date();
  const day = today.getDate().toString().padStart(2, '0');
  const month = (today.getMonth() + 1).toString().padStart(2, '0');
  const year = today.getFullYear().toString().substr(-4);
  const prefix = `${day}${month}${year}/BB`;
  orderNumber++;
  const paddedNumber = orderNumber.toString().padStart(4, '0');
  return `${prefix}${paddedNumber}`;
};


// randomNumber = Math.floor(Math.random() * 1000)