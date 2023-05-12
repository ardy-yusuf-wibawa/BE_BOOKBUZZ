let orderNumber = 0;

exports.incrementOrderNumber = () => {
  const prefix = 'BB';
  orderNumber++;
  const paddedNumber = orderNumber.toString().padStart(4, '0');
  return prefix + paddedNumber;
};