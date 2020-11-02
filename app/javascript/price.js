
window.addEventListener("load",()=>{
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input",() => {
    const inputValue = priceInput.value;
    const TaxInclude = document.getElementById("add-tax-price")
    const TaxIncludePrice = Math.floor(inputValue * 0.1)
    TaxInclude.innerHTML = TaxIncludePrice

    const Profit = document.getElementById("profit")
    const TotalProfit = inputValue - TaxIncludePrice
    Profit.innerHTML = TotalProfit
    })
})
