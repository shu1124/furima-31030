function item(){
  const charge_list = document.getElementById("item-price")
  charge_list.addEventListener("input", function() {
  const fee = document.getElementById("item-price").value
  const charge = Math.round(fee * 0.1 )
  const profit = fee - charge
  document.getElementById("add-tax-price").innerHTML = charge
  document.getElementById("profit").innerHTML = profit
  });
}
window.addEventListener("load",item)