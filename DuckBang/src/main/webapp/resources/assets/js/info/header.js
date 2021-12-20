const header_open = () => {
    document.querySelector(".header_phone_popup").classList.remove("hidden");
}

const header_close = () => {
    document.querySelector(".header_phone_popup").classList.add("hidden");
}


document.querySelector(".header_phone_btn").addEventListener("click", header_open);
document.querySelector(".header_popup_close_btn").addEventListener("click", header_close);
document.querySelector(".header_bg").addEventListener("click", header_close);


	