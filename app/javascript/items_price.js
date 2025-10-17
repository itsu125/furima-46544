document.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  if (!priceInput) return;

  priceInput.addEventListener('input', () => {
    const price = parseInt(priceInput.value, 10);

    if (!isNaN(price) && price >= 300 && price <= 9999999) {
      const tax = Math.floor(price * 0.1);
      const gain = Math.floor(price - tax);

      addTaxPrice.textContent = tax.toLocaleString();
      profit.textContent = gain.toLocaleString();
    } else {
      addTaxPrice.textContent = '0';
      profit.textContent = '0';
    }
  });
});