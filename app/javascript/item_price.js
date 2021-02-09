window.addEventListener('load', () => {
  // console.log("OK");←コンソール上に出力させるメソッド
  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    // console.log(inputValue);←コンソール上に出力させるメソッド

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    // add-tax-price=手数料  math.floor（小数点×0.1）を左の手数料のHTML(枠)に代入する 

    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(inputValue * 0.9);
    // const maxPriceInput = document.getElementById("")
    // addTaxDom.innerHTML = Math.floor("maxPriceInput * fee_rate")
 })
})


