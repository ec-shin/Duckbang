/**
 * 
 */

const open = document.querySelector(".profile_popup").classList.remove("hidden");

const close = document.querySelector(".profile_popup").classList.add("hidden");

document.querySelector(".profile_div3").addEventListener("click", open);
document.querySelector(".profile_popup_btn1").addEventListener("click", close);
document.querySelector(".profile_bg").addEventListener("click", close);