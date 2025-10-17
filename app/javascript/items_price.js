const price = () => {
  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  if (!priceInput) return;

  priceInput.addEventListener('input', () => {
    const value = parseInt(priceInput.value, 10);

    if (!isNaN(value) && value >= 300 && value <= 9999999) {
      const tax = Math.floor(value * 0.1);
      const gain = Math.floor(value - tax);

      addTaxPrice.textContent = tax.toLocaleString();
      profit.textContent = gain.toLocaleString();
    } else {
      addTaxPrice.textContent = '0';
      profit.textContent = '0';
    }
  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);