/**
 * 
 */

const open = () =>{
    document.querySelector(".info_popup").classList.remove("hidden");
}

const close = () =>{
    document.querySelector(".info_popup").classList.add("hidden");
}

document.querySelector(".info_a_1_2_btn").addEventListener("click", open);
document.querySelector(".info_popup_close_btn").addEventListener("click", close);
document.querySelector(".info_popup_1").addEventListener("click", close);